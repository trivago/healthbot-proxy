require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email) }
  end
end
