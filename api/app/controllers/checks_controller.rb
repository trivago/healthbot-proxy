class ChecksController < ApplicationController
  before_action :require_valid_access_token

  def ping
    render json: {}, status: 200
  end

  private

  def check
    @check ||= Healtcheck.find_by_slug(params[:id])
  end
end
