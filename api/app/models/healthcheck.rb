class Healthcheck < ApplicationRecord
  has_many :endpoints

  validates :name, presence: true

  extend FriendlyId
  friendly_id :name, use: :slugged
end
