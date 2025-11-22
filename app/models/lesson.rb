# frozen_string_literal: true

# == Schema Information
#
# Table name: lessons
#
#  id          :bigint           not null, primary key
#  description :text
#  lesson_type :string           not null
#  level       :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_lessons_on_created_at   (created_at)
#  index_lessons_on_lesson_type  (lesson_type)
#  index_lessons_on_level        (level)
#
class Lesson < ApplicationRecord
  # Constants
  LESSON_TYPES = %w[Video Text Mixed].freeze
  LEVELS = %w[A1 A2 B1 B2 C1 C2].freeze

  # Associations
  has_many :media_resources, dependent: :destroy
  has_many :vocabulary_items, dependent: :destroy
  has_many :quizzes, dependent: :destroy
  has_many :user_progresses, dependent: :destroy
  has_many :users, through: :user_progresses

  # Validations
  validates :title, presence: true
  validates :level, presence: true, inclusion: { in: LEVELS }
  validates :lesson_type, presence: true, inclusion: { in: LESSON_TYPES }

  # Scopes
  scope :by_level, ->(level) { where(level:) if level.present? }
  scope :by_type, ->(type) { where(lesson_type: type) if type.present? }
  scope :recent, -> { order(created_at: :desc) }
end

