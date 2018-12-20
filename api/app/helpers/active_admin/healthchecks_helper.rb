module ActiveAdmin
  module HealthchecksHelper
    def healthcheck_ping_url(healthcheck)
      token = AccessKey.active&.first&.token
      target = ping_check_url(healthcheck.slug, token: token)
      link_to target, target
    end
  end
end
