require 'rails_helper'

RSpec.describe Ping, type: :model do
  describe "associations" do
    it { should belong_to :endpoint }
  end

  describe "status" do
    it "can be undefined" do
      status = build(:ping)
      status.status_undefined!

      expect(status.status_undefined?).to be_truthy
    end

    it "can be error" do
      status = build(:ping)
      status.status_error!

      expect(status.status_error?).to be_truthy
    end

    it "can be success" do
      status = build(:ping)
      status.status_success!

      expect(status.status_success?).to be_truthy
    end
  end
end
