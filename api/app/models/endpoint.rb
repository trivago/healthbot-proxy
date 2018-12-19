class Endpoint < ApplicationRecord
  belongs_to :healthcheck
  has_many :pings

  validates :remote_url, presence: true
  validates :remote_url, url: true
end
