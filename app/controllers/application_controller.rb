# typed: false
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  prepend ActionPolicy::Draper
  include Pagy::Backend
  extend T::Sig

  verify_authorized

  before_action :set_paper_trail_whodunnit
  before_action :authenticate_user!
  before_action :set_raven_context

  helper_method :user_signed_out?
  helper_method :current_account
  helper_method :visited_account?
  helper_method :visited_account
  helper_method :disallowed_to?
  helper_method :pagy_array
  helper_method :pagy

  layout -> { ApplicationLayout }

  sig { params(visited: T::Key).returns(T::Key) }
  def self.visited(visited)
    @_visited = visited
  end

  private

  sig { returns T.nilable(account_id: String, user_id: String) }
  def set_raven_context
    Sentry.set_user(account_id: current_account.id, user_id: current_user.id) if user_signed_in?
  end

  sig { returns T.nilable(Account) }
  def current_account
    @current_account ||= current_user.account if user_signed_in?
  end

  sig { returns T.nilable(Account) }
  def visited_account
    @visited_account ||= self.class
                             .instance_variable_get(:@_visited)
                             .then { |visited| send(visited) if visited.present? }
  end

  sig { returns T::Boolean }
  def visited_account?
    visited_account.present? && visited_account != current_account
  end

  sig { returns T.nilable(String) }
  def id
    params.require(:id)
  end

  def disallowed_to?(rule, record = :__undef__, **options)
    !allowed_to?(rule, record, **options)
  end

  sig { returns T::Boolean }
  def user_signed_out?
    !user_signed_in?
  end
end
