require 'rails_helper'

RSpec.describe Endpoint, type: :model do
  describe "associations" do
    it { should belong_to(:healthcheck) }
  end

  describe "validations" do
    it { should validate_presence_of(:remote_url) }
  end
end
