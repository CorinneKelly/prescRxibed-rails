class ApplicationController < ActionController::API
  before_action :authenticate
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end

  def logged_in?
    authenticate_or_request_with_http_token do |token, options|
      Account.from_token
    end
  end

end
