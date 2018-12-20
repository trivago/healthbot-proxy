class ChecksController < ApiController
  before_action :require_valid_access_token

  rescue_from ActiveRecord::RecordNotFound do |err|
    render json: {}, status: 404
  end

  def ping
    pings = HealthcheckPinger.ping_all(check)
    converted = pings.map do |p|
      {
        endpoint_url: p.endpoint.remote_url,
        status: p.status,
        created_at: p.created_at,
        response: p.response
      }
    end
    render json: converted, status: 200
  end

  private

  def find_check
    result = Healthcheck.friendly.find(params[:id])
    raise ActiveRecord::RecordNotFound.new("not found") if result.blank?
    result
  end

  def check
    @check ||= find_check
  end
end
