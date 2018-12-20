require 'rails_helper'

RSpec.describe Endpoint, type: :model do
  describe "associations" do
    it { should belong_to(:healthcheck) }
    it { should have_many(:pings) }
  end

  describe "validations" do
    it { should validate_presence_of(:remote_url) }

    describe "url validation" do
      it "validates proper url format" do
        model = build(:endpoint, remote_url: "asd test")
        expect(model.valid?).to be_falsey

        model = build(:endpoint, remote_url: "http://foobar")
        expect(model.valid?).to be_truthy
      end
    end
  end

  describe "scopes" do
    describe ".active" do
      it "returns all active endpoints" do
        create(:endpoint, active: false)
        ep = create(:endpoint, active: true)

        actives = described_class.active
        expect(actives.length).to eq(1)
        expect(actives.first.id).to eq(ep.id)
      end
    end
  end

end
