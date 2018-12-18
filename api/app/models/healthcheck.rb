class Healthcheck < ApplicationRecord
  include Sluggi::Slugged

  has_many :endpoints

  validates :name, presence: true

  def slug_value
    name
  end

  def slug_value_changed?
    name_changed?
  end
end
