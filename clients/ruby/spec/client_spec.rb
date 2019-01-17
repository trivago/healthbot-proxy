RSpec.describe HealtcheckProxyClient::Client do
  describe ".ping" do
    it "pings the given url" do
      allow(Faraday).to receive(:get)

      described_class.ping(
        configuration: build_config,
        healthcheck: "test"
      )

      expect(Faraday).to have_received(:get).exactly(:once)
      expect(Faraday).to have_received(:get).with("test.com/test/ping?token=123")
    end

    it "raises an error" do
      allow(Faraday).to receive(:get).and_raise(Faraday::Error)

      expect{
        described_class
          .ping(configuration: build_config, healthcheck: "test")
      }.to raise_error(HealtcheckProxyClient::HttpError)
    end
  end

  def build_config
    config          = HealtcheckProxyClient::Configuration.new
    config.endpoint = "test.com"
    config.api_key  = 123
    config
  end
end
