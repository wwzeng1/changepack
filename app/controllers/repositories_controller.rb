# typed: false
# frozen_string_literal: true

class RepositoriesController < ApplicationController
  def index
    authorize!
    pagy, repositories = pagy(collection)

    render locals: { repositories:, pagy: }
  end

  def confirm_update
    authorize! repository, to: :update? and render item
  end

  def update
    authorize! repository

    repository.transition_to!(:active)
    redirect_to repositories_url
  end

  def confirm_destroy
    authorize! repository, to: :destroy? and render item
  end

  def destroy
    authorize! repository

    repository.transition_to!(:inactive)
    redirect_to repositories_url
  end

  private

  def repository
    @repository ||= collection.find(id)
  end

  def collection
    authorized(Repository.activity.kept)
  end

  def item
    {
      locals: { repository: }
    }
  end
end
