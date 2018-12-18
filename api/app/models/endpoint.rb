class Endpoint < ApplicationRecord
  belongs_to :healthcheck

  validates :remote_url, presence: true
end
