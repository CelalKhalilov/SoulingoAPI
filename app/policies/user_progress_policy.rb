# frozen_string_literal: true

class UserProgressPolicy < ApplicationPolicy
  def index?
    user.present? && (user.id == record.id || user.admin?)
  end

  def update?
    user.present? && (user.id == record.user_id || user.admin?)
  end
end

