require 'rails_helper'

RSpec.describe AccessKey, type: :model do
  describe "before validation" do
    it "sets a key" do
      model = build(:access_key, token: nil)
      model.save!

      expect(model.token).to be_present
    end
  end
end
