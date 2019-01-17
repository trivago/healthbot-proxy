require "faraday"

require "healtcheck_proxy_client/version"
require "healtcheck_proxy_client/client"
require "healtcheck_proxy_client/http_error"
require "healtcheck_proxy_client/railtie" if defined?(Rails)

module HealtcheckProxyClient
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.ping(healthcheck)
    Client.ping(configuration: configuration, healthcheck: healthcheck)
  end

  class Configuration
    attr_accessor :endpoint,
                  :api_key

    def initialize
      @endpoint = 'https://trivago-healthcheck-proxy.herokuapp.com'
    end
  end

end
