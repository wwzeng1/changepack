# typed: false
# frozen_string_literal: true

module T
  AccessToken = T.type_alias { ::AccessToken }
  AccessTokens = T.type_alias { ::AccessToken::RelationType }
end

class AccessToken < ApplicationRecord
  key :tok

  attribute :provider, :string
  attribute :token, :string

  belongs_to :user
  belongs_to :account
  has_many :repositories, dependent: :nullify

  validates :provider, presence: true, inclusion: { in: Provider.to_a }
  validates :token, presence: true, uniqueness: { scope: %i[account_id provider] }

  after_initialize do
    self.account ||= user&.account if user_id.present?
  end

  def to_s
    token
  end
end
