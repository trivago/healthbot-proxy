require 'rails_helper'

RSpec.describe HealthcheckPinger do
  describe ".ping" do
    it "sends a request to the given url" do
      allow(Faraday).to receive(:get) { OpenStruct.new(body: "yes", status: 200) }

      described_class.ping(create(:endpoint))

      expect(Faraday).to have_received(:get).exactly(1).times
    end

    it "stores the response in the database" do
      endpoint = create(:endpoint)
      allow(Faraday).to receive(:get) { OpenStruct.new(body: "foobar", status: 200) }

      described_class.ping(endpoint)
      ping = endpoint.pings.first
      expect(ping).to be_present
      expect(ping.status_success?).to be_truthy
      expect(ping.response).to eq("foobar")
    end

    it "stores the response in the database when there was an error" do
      endpoint = create(:endpoint)
      allow(Faraday).to receive(:get) { raise Faraday::Error.new("error") }

      described_class.ping(endpoint)
      ping = endpoint.pings.first
      expect(ping).to be_present
      expect(ping.status_error?).to be_truthy
      expect(ping.response).to eq("error")
    end

    it "stores the response in the database when there was an error http status code" do
      endpoint = create(:endpoint)
      allow(Faraday).to receive(:get) { OpenStruct.new(body: "wrong status code", status: 401) }

      described_class.ping(endpoint)
      ping = endpoint.pings.first
      expect(ping).to be_present
      expect(ping.status_error?).to be_truthy
      expect(ping.response).to eq("wrong status code")
    end
  end


  describe ".ping_all" do
    it "pings every health service" do
      hc = create(:healthcheck)
      create(:endpoint, healthcheck: hc)
      create(:endpoint, healthcheck: hc)
      allow(described_class).to receive(:ping)

      described_class.ping_all(hc)

      expect(described_class).to have_received(:ping).exactly(2).times
    end

    it "only pings active endpoints" do
      hc = create(:healthcheck)
      create(:endpoint, healthcheck: hc)
      create(:endpoint, healthcheck: hc, active: false)
      allow(described_class).to receive(:ping)

      described_class.ping_all(hc)

      expect(described_class).to have_received(:ping).exactly(1).times
    end
  end
end
