# frozen_string_literal: true

# == Schema Information
#
# Table name: media_resources
#
#  id         :bigint           not null, primary key
#  media_type :string           not null
#  mime_type  :string
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  lesson_id  :bigint           not null
#
# Indexes
#
#  index_media_resources_on_lesson_id   (lesson_id)
#  index_media_resources_on_media_type  (media_type)
#
# Foreign Keys
#
#  fk_rails_...  (lesson_id => lessons.id)
#
class MediaResource < ApplicationRecord
  # Constants
  MEDIA_TYPES = %w[Video Image Audio Document].freeze

  # Associations
  belongs_to :lesson

  # Validations
  validates :url, presence: true
  validates :media_type, presence: true, inclusion: { in: MEDIA_TYPES }

  # Scopes
  scope :videos, -> { where(media_type: 'Video') }
  scope :images, -> { where(media_type: 'Image') }
  scope :audios, -> { where(media_type: 'Audio') }
  scope :documents, -> { where(media_type: 'Document') }
end

