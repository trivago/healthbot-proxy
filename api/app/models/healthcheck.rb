class Healthcheck < ApplicationRecord
  validates :name, presence: true

  before_validation :generate_slug, unless: :slug

  private

  def generate_slug
    return true if name.blank?
    new_slug = nil
    self.slug = loop do
      if new_slug.blank?
        new_slug = name.parameterize
      else
        new_slug = "#{new_slug}-#{SecureRandom.hex(1)}"
      end
      break new_slug unless Healthcheck.exists?(slug: new_slug)
    end
  end

end
