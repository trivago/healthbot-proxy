class Healthcheck < ApplicationRecord
  has_many :endpoints

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
