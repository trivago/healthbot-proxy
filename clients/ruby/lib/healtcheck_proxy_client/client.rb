require 'forwardable'

module HealtcheckProxyClient
  class Client
    extend Forwardable

    def initialize(configuration:, healthcheck:)
      @configuration = configuration
      @healthcheck   = healthcheck
    end

    def self.ping(configuration:, healthcheck:)
      new(configuration: configuration, healthcheck: healthcheck).ping
    end

    def ping
      validate_response(Faraday.get(url))
    rescue Faraday::Error => e
      raise HttpError.new(e.message, http_error: e)
    end

    private

    def_delegators :@configuration, :api_key, :endpoint

    def url
      "#{endpoint}/checks/#{@healthcheck}/ping?token=#{api_key}"
    end

    def validate_response(response)
      return response if response.status == 200
      raise HttpError.new(
        "Invalid HTTP Status code: #{response.status}",
        http_error: response
      )
    end
  end
end
