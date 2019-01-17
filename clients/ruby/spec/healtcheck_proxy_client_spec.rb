RSpec.describe HealtcheckProxyClient do
  describe "version" do
    it "has a version number" do
      expect(HealtcheckProxyClient::VERSION).not_to be nil
    end
  end

  describe ".configuration" do
    it "has a default value for the endpoint" do
      HealtcheckProxyClient.configure {|config|}

      expect(described_class.configuration.endpoint)
        .to eq("https://trivago-healthcheck-proxy.herokuapp.com")

    end

    it "allows an endpoint to be set" do
      HealtcheckProxyClient.configure do |config|
        config.endpoint = "foobar"
      end

      expect(described_class.configuration.endpoint).to eq("foobar")
    end

    it "allows an api key to be set" do
      HealtcheckProxyClient.configure do |config|
        config.api_key = "secret"
      end

      expect(described_class.configuration.api_key).to eq("secret")
    end
  end

  describe ".ping" do
    it "pings the given healthcheck name" do
      allow(HealtcheckProxyClient::Client).to receive(:ping)

      described_class.ping("foobar")

      expect(HealtcheckProxyClient::Client).to have_received(:ping)
    end
  end
end
