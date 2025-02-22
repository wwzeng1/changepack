# typed: false
# frozen_string_literal: true

class Source
  class OnRepositoryDestroyed < Handler
    on ::Repository::Destroyed

    sig { override.returns T.nilable(Source) }
    def run
      Source.find_by(repository_id: event.id).try(:destroy)
    end
  end
end
