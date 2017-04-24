class V1::EventsController < ApplicationController

  def index
    account = @current_account
    newApiRequest = GoogleCalendarApi.new(account.googleToken)
    response = newApiRequest.getEvents
    render json: {response: response}
  end


end
