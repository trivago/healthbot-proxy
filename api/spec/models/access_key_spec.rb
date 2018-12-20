require 'rails_helper'

RSpec.describe AccessKey, type: :model do
  describe "before validation" do
    it "sets a key" do
      model = build(:access_key, token: nil)
      model.save!

      expect(model.token).to be_present
    end
  end

  describe "scopes" do
    describe ".active" do
      it "returns all active access keys" do
        create(:access_key, active: false)
        ak = create(:access_key, active: true)

        actives = described_class.active
        expect(actives.length).to eq(1)
        expect(actives.first.id).to eq(ak.id)
      end
    end
  end
end
