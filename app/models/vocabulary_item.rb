# frozen_string_literal: true

# == Schema Information
#
# Table name: vocabulary_items
#
#  id               :bigint           not null, primary key
#  example_sentence :text
#  meaning          :string           not null
#  part_of_speech   :string
#  word             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  lesson_id        :bigint           not null
#
# Indexes
#
#  index_vocabulary_items_on_lesson_id  (lesson_id)
#  index_vocabulary_items_on_word       (word)
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#
class VocabularyItem < ApplicationRecord
  # Constants
  PARTS_OF_SPEECH = %w[noun verb adjective adverb pronoun preposition conjunction interjection].freeze

  # Associations
  belongs_to :lesson

  # Validations
  validates :word, presence: true
  validates :meaning, presence: true
  validates :part_of_speech, inclusion: { in: PARTS_OF_SPEECH, allow_nil: true }

  # Scopes
  scope :by_part_of_speech, ->(pos) { where(part_of_speech: pos) if pos.present? }
end

