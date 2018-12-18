require 'rails_helper'

RSpec.describe Healthcheck, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "before save" do
    it "sets a slug based on the name" do
      model = create(:healthcheck, name: 'Sample')

      expect(model.slug).to eq('sample')
    end

    it "sets another slug if an entry with the same slug exists" do
      create(:healthcheck, name: 'Sample')
      allow(SecureRandom).to receive(:hex) { "1" }
      model_two = create(:healthcheck, name: 'Sample')

      expect(model_two.slug).to eq('sample-1')
    end
  end
end
