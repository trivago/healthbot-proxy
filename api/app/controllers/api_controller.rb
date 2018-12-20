class ApiController < ActionController::API

  def require_valid_access_token
    authenticate_token || render_unauthorized("Access denied")
  end

  private

  def render_unauthorized(message)
    render(json: { error: message }, status: :unauthorized)
  end

  def authenticate_token
    AccessKey.find_by(token: token)
  end

  def http_authentication_token
    ActionController::HttpAuthentication::Token.token_and_options(request).try(:first)
  end

  def token
    query_string_token || http_authentication_token
  end

  def query_string_token
    params[:token]
  end
end
