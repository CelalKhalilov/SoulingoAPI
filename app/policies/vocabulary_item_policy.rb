# frozen_string_literal: true

class VocabularyItemPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end
end

