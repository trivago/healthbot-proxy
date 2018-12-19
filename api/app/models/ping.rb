class Ping < ApplicationRecord
  belongs_to :endpoint

  enum status: { undefined: 0, error: 100, success: 200 }, _prefix: :status
end
