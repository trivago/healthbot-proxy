class HealthcheckPinger
  def self.ping(endpoint)
    true
  end

  def self.ping_all(healthcheck)
    healthcheck.endpoints.each { |ep| ping(ep) }
  end
end
