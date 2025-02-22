# typed: false
# frozen_string_literal: true

class Commit
  class Author
    include ValueObject

    attribute :name, :string
    attribute :email, :string

    validates :name, presence: true
    # Do not validate with URI::MailTo::EMAIL_REGEXP as it doesn't work with Dependabot
    # Example: 49699333+dependabot[bot]@users.noreply.github.com
    validates :email, presence: true

    normalize :name
    normalize :email
  end
end
