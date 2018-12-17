class AccessKey < ApplicationRecord
  has_secure_token

  validates :token, presence: true
end
