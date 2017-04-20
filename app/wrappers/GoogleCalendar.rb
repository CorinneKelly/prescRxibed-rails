require 'httparty'

class GoogleCalendar
	include HTTParty

	def postEvent(access_token, request_body)
		auth_header = { "Authorization": "Bearer #{access_token}",
										"Content-Type": "application/json" }
		# request_body = {"summary": "Appointment",
		# 							  "start": {
		# 							    "dateTime": "2017-04-18T10:00:00.000-07:00"
		# 							  },
		# 							  "end": {
		# 							    "dateTime": "2017-04-19T10:25:00.000-07:00"
		# 							  }
		# 							}
		request = HTTParty.post("https://www.googleapis.com/calendar/v3/calendars/primary/events", headers: auth_header, body: request_body.to_json)
	end

end










	# event = Google::Apis::CalendarV3::Event.new{
	#   summary: 'Google I/O 2015',
	#   location: '800 Howard St., San Francisco, CA 94103',
	#   description: 'A chance to hear more about Google\'s developer products.',
	#   start: {
	#     date_time: '2015-05-28T09:00:00-07:00',
	#     time_zone: 'America/Los_Angeles',
	#   },
	#   end: {
	#     date_time: '2015-05-28T17:00:00-07:00',
	#     time_zone: 'America/Los_Angeles',
	#   },
	#   recurrence: [
	#     'RRULE:FREQ=DAILY;COUNT=2'
	#   ],
	#   attendees: [
	#     {email: 'lpage@example.com'},
	#     {email: 'sbrin@example.com'},
	#   ],
	#   reminders: {
	#     use_default: false,
	#     overrides: [
	#       {method' => 'email', 'minutes: 24 * 60},
	#       {method' => 'popup', 'minutes: 10},
	#     ],
	#   },
	# }

	# result = client.insert_event('primary', event)
	# puts "Event created: #{result.html_link}"
