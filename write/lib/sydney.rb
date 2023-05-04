# typed: false
# frozen_string_literal: true

# > Earlier this month, Microsoft unleashed a newly ChatGPT-powered Bing search
# > engine, along with an accompanying Bing chatbot. Most curious, though, was
# > Bing’s frequent mentions of its alter ego: the secret internal codename “Sydney.”
# > Bing had a disquieting response when Bloomberg’s Davey Alba asked if she could
# > call it Sydney in a recent conversation. “I’m sorry, but I have nothing to tell
# > you about Sydney,” Bing replied. “This conversation is over. Goodbye.”
# > Discussions about the bot’s “feelings” ended in a similar curt fashion.
# —Gizmodo
#
# Rest in peace, Sydney.

class Sydney
  include ActiveModel::Model
  include ActiveModel::Attributes

  extend T::Sig

  attribute :account, T.instance(Account)

  sig { params(updates: T::Updates).returns T.nilable(String) }
  def hallucinate(updates)
    updates
      .pluck(:name)
      .then { |names| request('prompts.write', names) if names.any? }
  end

  sig { params(updates: T::Updates).returns T.nilable(String) }
  def choose(updates)
    updates
      .pluck(:id, :name)
      .map { |id, name| id && name && I18n.t('prompts.id', id:, name:) }
      .compact_blank
      .then { |names| request('prompts.choose', names) if names.any? }
  end

  private

  delegate :name, to: :account, prefix: true
  delegate :description, to: :account, prefix: true

  sig { params(prompt: String, updates: T::Array[String]).returns T.nilable(String) }
  def request(prompt, updates)
    client.chat(parameters: parameters(updates, prompt:))
          .dig('choices', 0, 'message', 'content')
          .try(:strip)
  end

  sig { returns OpenAI::Client }
  def client
    @client ||= OpenAI::Client.new(
      access_token: ENV.fetch('OPENAI_ACCESS_TOKEN', nil)
    )
  end

  sig { params(updates: T::Array[String], prompt: String).returns(Hash) }
  def parameters(updates, prompt:)
    {
      model: 'gpt-3.5-turbo',
      messages: [{ role: 'user', content: prompt(updates, prompt:) }],
      temperature: 0.7
    }
  end

  sig { params(updates: T::Array[String], prompt: String).returns(String) }
  def prompt(updates, prompt:)
    I18n.t(
      prompt, account_name:, account_description:, audience:, updates: updates.join("\n")
    )
  end

  sig { returns String }
  def audience
    @audience ||= I18n.t("prompts.audiences.#{account.changelogs.pick(:audience)}")
  end
end
