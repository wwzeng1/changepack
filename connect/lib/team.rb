# typed: false
# frozen_string_literal: true

class Team < ApplicationRecord
  include Events
  include Pull

  include Resourcable
  include Status
  include Active

  key :tm

  attribute :name, :string
  attribute :schema, Schema.to_type, default: -> { {} }
  attribute :status, :string, default: :inactive

  belongs_to :account
  belongs_to :access_token, optional: true
  has_many :issues, dependent: :destroy

  validates :name, presence: true
  validates :schema, store_model: true
  validates :status, presence: true
  normalize :name

  inquirer :status

  sig { returns T::Hash[Symbol, T.any(String, Hash)] }
  def self.to_shape
    {
      name: String,
      providers: { linear: String },
      schema: Schema.to_shape
    }
  end
end
