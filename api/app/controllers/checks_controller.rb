class ChecksController < ApplicationController
  before_action :require_valid_access_token

  def create
    render json: {}, status: 200
  end
end
