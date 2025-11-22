# frozen_string_literal: true

# == Schema Information
#
# Table name: user_progresses
#
#  id                 :bigint           not null, primary key
#  completion_percent :integer          default(0)
#  correct_answers    :integer          default(0)
#  total_questions    :integer          default(0)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  lesson_id          :bigint           not null
#  user_id            :bigint           not null
#
# Indexes
#
#  index_user_progresses_on_lesson_id              (lesson_id)
#  index_user_progresses_on_user_id                (user_id)
#  index_user_progresses_on_user_id_and_lesson_id  (user_id,lesson_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#  fk_rails_...  (user_id => users.id)
#
class UserProgress < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :lesson

  # Validations
  validates :user_id, uniqueness: { scope: :lesson_id }
  validates :completion_percent, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :correct_answers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total_questions, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Scopes
  scope :completed, -> { where(completion_percent: 100) }
  scope :in_progress, -> { where('completion_percent > 0 AND completion_percent < 100') }
  scope :not_started, -> { where(completion_percent: 0) }

  # Methods
  def calculate_score
    return 0 if total_questions.zero?

    (correct_answers.to_f / total_questions * 100).round(2)
  end

  def completed?
    completion_percent == 100
  end
end

