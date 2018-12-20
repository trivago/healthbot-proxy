class HealthcheckPinger
  def initialize(endpoint)
    @endpoint = endpoint
  end

  def self.ping(endpoint)
    new(endpoint).ping
  end

  def self.ping_all(healthcheck)
    healthcheck.endpoints.where(active: true).map { |ep| ping(ep) }
  end

  def ping
    send_request = endpoint.pings.create!
    request_data(send_request)
    send_request
  end

  private

  attr_reader :endpoint

  def request_data(result_ping)
    response = Faraday.get(endpoint.remote_url)
    if response.status == 200
      handle_response(result_ping, response.body, success: true)
    else
      handle_response(result_ping, response.body)
    end
    response.body
  rescue Faraday::Error => e
    handle_response(result_ping, e.message)
  end

  def handle_response(result_ping, response, success: false)
    result_ping.response = response
    if success
      result_ping.status_success!
    else
      result_ping.status_error!
    end
  end

end
