# frozen_string_literal: true

class MediaResourcePolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def upload?
    user.present?
  end
end

