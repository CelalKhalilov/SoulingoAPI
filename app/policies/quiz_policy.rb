# frozen_string_literal: true

class QuizPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    user.present?
  end

  def submit?
    user.present?
  end
end

