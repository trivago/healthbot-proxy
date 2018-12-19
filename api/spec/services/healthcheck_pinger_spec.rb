require 'rails_helper'

RSpec.describe HealthcheckPinger do
  describe ".ping_all" do
    it "pings every health service" do
      hc = create(:healthcheck)
      create(:endpoint, healthcheck: hc)
      create(:endpoint, healthcheck: hc)
      allow(described_class).to receive(:ping)

      described_class.ping_all(hc)

      expect(described_class).to have_received(:ping).exactly(2).times
    end
  end
end
