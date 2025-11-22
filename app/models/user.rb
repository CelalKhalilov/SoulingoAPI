# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  allow_password_change  :boolean          default(FALSE), not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :inet
#  display_name           :string
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default("")
#  last_name              :string           default("")
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :inet
#  level                  :string           default("A1")
#  provider               :string           default("email"), not null
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  tokens                 :json
#  uid                    :string           default(""), not null
#  username               :string           default("")
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_level                 (level)
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_uid_and_provider      (uid,provider) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  # Associations
  has_many :user_progresses, dependent: :destroy
  has_many :lessons, through: :user_progresses

  # Validations
  validates :uid, uniqueness: { scope: :provider }
  validates :level, inclusion: { in: %w[A1 A2 B1 B2 C1 C2], allow_nil: true }

  attribute :impersonated_by, :integer

  before_validation :init_uid

  RANSACK_ATTRIBUTES = %w[id email first_name last_name username display_name level sign_in_count
                          current_sign_in_at last_sign_in_at current_sign_in_ip last_sign_in_ip
                          provider uid created_at updated_at].freeze

  LANGUAGE_LEVELS = %w[A1 A2 B1 B2 C1 C2].freeze

  def self.from_social_provider(provider, user_params)
    where(provider:, uid: user_params['id']).first_or_create! do |user|
      user.password = Devise.friendly_token[0, 20]
      user.assign_attributes user_params.except('id')
    end
  end

  def full_name
    return username if first_name.blank?

    "#{first_name} #{last_name}"
  end

  private

  def init_uid
    self.uid = email if uid.blank? && provider == 'email'
  end
end
