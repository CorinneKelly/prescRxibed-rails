require 'httparty'

class GoogleCalendarApi
	include HTTParty
	attr_accessor :access_token, :request_body, :response

	def initialize(access_token, request_body="")
		@access_token = access_token
		@request_body = request_body
	end

	def postEvent
		auth_header = { "Authorization": "Bearer #{@access_token}",
										"Content-Type": "application/json" }
		@response = HTTParty.post("https://www.googleapis.com/calendar/v3/calendars/primary/events", headers: auth_header, body: @request_body.to_json)
	end

	def getEvents
		auth_header = { "Authorization": "Bearer #{@access_token}"}
		@response = HTTParty.get("https://www.googleapis.com/calendar/v3/calendars/primary/events?maxResults=250&q=Prescription&showDeleted=false&singleEvents=true", headers: auth_header)
	end


	def deleteEvent
		auth_header = { "Authorization": "Bearer #{@access_token}"}
		@response = HTTParty.delete("https://www.googleapis.com/calendar/v3/calendars/primary/events/#{@request_body[:eventId]}", headers: auth_header)
	end

end
