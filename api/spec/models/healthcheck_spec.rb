require 'rails_helper'

RSpec.describe Healthcheck, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should have_many(:endpoints) }
  end

  describe "before save" do
    it "sets a slug based on the name" do
      model = create(:healthcheck, name: 'Sample', slug: nil)

      expect(model.slug).to eq('sample')
    end

    it "sets a custom slug if it is already taken" do
      create(:healthcheck, name: 'Sample')
      model = create(:healthcheck, name: 'Sample')
      expect(model).to be_present
    end
  end

  describe "updating slug" do
    it "should update the slug if the name changed" do
      check = create(:healthcheck, name: 'Sample')

      check.name ='Hans'
      check.save!
      expect(check.slug).to eq('hans')
    end
  end
end
