class Healthcheck < ApplicationRecord
  include Sluggi::Slugged

  has_many :endpoints

  validates :name, presence: true

  def slug_value_changed?
    name_changed?
  end

  # The first unused value in the list is used.
  # Each item may be a value or a lambda.
  # Use a lambda to defer expensive unique value calculations.
  def slug_candidates
    [
      name,
      -> { "#{name}-#{self.class.count}" }
    ]
  end
end
