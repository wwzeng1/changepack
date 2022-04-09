# frozen_string_literal: true

class ChangelogPolicy < ApplicationPolicy
  alias_rule :edit?, :update?, :destroy?, to: :manage?
  alias_rule :show?, :new?, :create?, :confirm_destroy?, to: :index?

  relation_scope do |relation|
    relation.where(account_id: user.account_id)
  end

  def index?
    true
  end

  def manage?
    return false if user.nil? || record.nil? || record_is_class?

    user.account_id == record.account_id
  end
end
