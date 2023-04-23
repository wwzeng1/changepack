# typed: false
# frozen_string_literal: true

class Commit
  module Events
    extend ActiveSupport::Concern

    class Created < Event
      attribute :id, String
      attribute :account_id, String
      attribute :message, String
    end
  end
end
