# frozen_string_literal: true

module Commits
  class Pull < Command
    Disconnected = Class.new(Command::Error)

    option :repository, model: Repository

    validate do
      raise Disconnected unless user.git?
    end

    def execute
      git.commits(repository.provider_id, after: cursor).each do |c|
        commit = upsert!(c)
        after_commit { Pulled.new(id: commit.id).publish }
      end

      repository.update!(pulled: Time.current)
    end

    private

    def git
      @git ||= Adapters::Adapter.find_by(user:)
    end

    def cursor
      @cursor ||= repository.commits
                            .where('commited > ?', 1.month.ago)
                            .order(commited: :desc)
                            .limit(1)
                            .pick(:commited)
    end

    def upsert!(commit)
      Commit.find_or_initialize_by(repository:, provider: git.provider, provider_id: commit.sha) do |c|
        c.update!(
          message: commit.message,
          url: commit.url,
          commited: commit.commited,
          author: { name: commit.author.name, email: commit.author.email },
          account:
        )
      end
    end

    delegate :user, :account, to: :repository
  end
end
