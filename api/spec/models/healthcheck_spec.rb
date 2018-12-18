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
  end
end
