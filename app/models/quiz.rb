# frozen_string_literal: true

# == Schema Information
#
# Table name: quizzes
#
#  id            :bigint           not null, primary key
#  correct_index :integer          not null
#  options       :json             not null
#  question      :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  lesson_id     :bigint           not null
#
# Indexes
#
#  index_quizzes_on_lesson_id  (lesson_id)
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#
class Quiz < ApplicationRecord
  # Associations
  belongs_to :lesson

  # Validations
  validates :question, presence: true
  validates :options, presence: true
  validates :correct_index, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :validate_options_format
  validate :validate_correct_index_in_range

  # Methods
  def check_answer(answer_index)
    answer_index.to_i == correct_index
  end

  private

  def validate_options_format
    return if options.blank?

    unless options.is_a?(Array) && options.all? { |opt| opt.is_a?(String) }
      errors.add(:options, 'must be an array of strings')
    end
  end

  def validate_correct_index_in_range
    return if options.blank? || correct_index.blank?

    if correct_index >= options.length || correct_index.negative?
      errors.add(:correct_index, 'must be within the range of options')
    end
  end
end

