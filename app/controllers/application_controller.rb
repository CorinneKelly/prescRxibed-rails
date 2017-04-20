class ApplicationController < ActionController::API
  before_action :authenticate
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authenticate
    render json: {error: "Unauthorized"}, status: 401 unless logged_in?
  end

  def logged_in?
    !!current_account
  end

  def current_account
    @current_account = Account.from_token(request.headers["token"])
  end

end
