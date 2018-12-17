require 'rails_helper'

RSpec.describe AccessKey, type: :model do
  describe "validations" do
    it { should validate_presence_of(:token) }
  end
end
