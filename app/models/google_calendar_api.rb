require 'httparty'

class GoogleCalendarApi
	include HTTParty
	attr_accessor :access_token, :request_body, :response

	def initialize(access_token, request_body)
		@access_token = access_token
		@request_body = request_body
	end

	def postEvent
		byebug
		auth_header = { "Authorization": "Bearer #{@access_token}",
										"Content-Type": "application/json" }
		@response = HTTParty.post("https://www.googleapis.com/calendar/v3/calendars/primary/events", headers: auth_header, body: @request_body.to_json)
	end

end