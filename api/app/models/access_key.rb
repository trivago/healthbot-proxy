class AccessKey < ApplicationRecord
  validates :token, presence: true

  # generate unique token before save
  before_validation :generate_token, unless: :token

  private

  def generate_token
    self.token = loop do
      random_token = SecureRandom.hex
      break random_token unless AccessKey.exists?(token: random_token)
    end
  end
end
