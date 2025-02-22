# typed: false
# frozen_string_literal: true

class Provider
  class Linear < Provider
    sig { override.returns(Results) }
    def teams
      client.query(parse(:teams), context:)
            .data
            .teams
            .nodes
            .then { |teams| transform(teams) }
            .map { |team| Mapper.team(team) }
    end

    sig { override.params(team: Team).returns(Results) }
    def issues(team)
      client.query(parse(:issues), variables: variables(team), context:)
            .data
            .team
            .issues
            .nodes
            .then { |issues| transform(issues) }
            .map { |issue| Mapper.issue(issue, team:) }
    end

    private

    sig { params(query: Symbol).returns(GraphQL::Client::OperationDefinition) }
    def parse(query)
      client.parse(
        Rails.root.join('connect', 'lib', 'provider', "#{query}.graphql").read
      )
    end

    sig { params(results: Results).returns(Results) }
    def transform(results)
      results.map(&:to_h)
             .map { |result| result.deep_transform_keys { |key| key.to_s.underscore } }
             .map { |result| Hashie::Mash.new(result) }
    end

    sig { params(team: Team).returns(Hash) }
    def variables(team)
      { teamId: team.linear }
    end

    sig { override.returns(GraphQL::Client) }
    def client
      @client ||= GraphQL::Client.new(
        schema: GraphQL::Client.load_schema(http),
        execute: http
      ).tap { |client| client.allow_dynamic_queries = true }
    end

    sig { returns(GraphQL::Client::HTTP) }
    def http
      @http ||= GraphQL::Client::HTTP.new('https://api.linear.app/graphql') do
        def headers(context) # rubocop:disable Lint/NestedMethodDefinition
          {
            'Authorization' => "Bearer #{context[:access_token]}",
            'Content-Type' => 'application/json'
          }
        end
      end
    end
  end

  sig { returns(access_token: String) }
  def context
    @context ||= { access_token: access_token.to_s }
  end

  class Mapper
    class << self
      extend T::Sig

      sig { params(team: Hash).returns(Hash) }
      def team(team)
        {
          name: team.name,
          providers: { linear: team.id },
          schema: schema(team)
        }
      end

      sig { params(team: Hash).returns(Hash) }
      def schema(team)
        {
          done: {
            type: :object,
            required: [:id],
            properties: {
              id: { const: team.merge_workflow_state.id }
            }
          }
        }
      end

      sig { params(issue: Hash, team: Team).returns(Hash) }
      def issue(issue, team:)
        {
          title: issue.title,
          description: issue.description,
          providers: { linear: issue.id }
        }.merge(
          **completion(issue, team:), **meta(issue)
        )
      end

      sig { params(issue: Hash, team: Team).returns(Hash) }
      def completion(issue, team:)
        {
          assignee: assignee(issue),
          branch: issue.branch_name,
          done: team.schema.done.validate(issue.state)
        }
      end

      sig { params(issue: Hash).returns(Hash) }
      def meta(issue)
        {
          priority: issue.priority,
          issued_at: issue.created_at,
          identifier: issue.identifier,
          labels: issue.labels.nodes.map(&:name)
        }
      end

      sig { params(issue: Hash).returns(T.nilable(Hash)) }
      def assignee(issue)
        return if issue.assignee.blank?

        {
          name: issue.assignee.name,
          email: issue.assignee.email,
          providers: { linear: issue.assignee.id }
        }
      end
    end
  end
end
