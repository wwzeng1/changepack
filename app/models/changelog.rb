# typed: false
# frozen_string_literal: true

module T
  Changelog = T.type_alias { ::Changelog }
  Changelogs = T.type_alias { ::Changelog::RelationType }
end

class Changelog < ApplicationRecord
  include Slug

  key :cl

  attribute :name, :string

  belongs_to :account
  has_many :posts, dependent: :destroy

  private

  sig { returns T::Array[Symbol] }
  def slug_candidates
    [
      %i[name set_slug_pretty_id]
    ]
  end
end
