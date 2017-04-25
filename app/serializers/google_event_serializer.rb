class GoogleEventSerializer
  attr_accessor :prescription, :schedule, :request_body

  def initialize(prescription, schedule)
    @prescription = prescription
    @schedule = schedule
  end


  def determineSerializeType
    case @schedule[:frequency]
    when "daily"
      self.serializeDailyFrequency
    when "weekly"
      self.serializeWeeklyFrequency
    when "monthly"
      self.serializeMonthlyFrequency
    end
  end

  def serializeWeeklyFrequency
    numberOfEvents = ((@prescription[:quantity]/@prescription[:dosage])*(@prescription[:refills]+1)).to_i
    days = @schedule[:weekdays].join(",")
    freq = "FREQ=WEEKLY;"
    count = "COUNT=#{numberOfEvents};"
    rrule = "RRULE:" + freq + count + "BYDAY=" + days

    @request_body = {
      "summary": "Prescription Reminder: #{@prescription[:name]}",
      "description": "#{@prescription[:instructions]}",
      "id": "0000#{@prescription[:id]}",

      "start": {
        "dateTime": "#{DateTime.parse(@schedule[:start_date].to_s)+(13/24.0)}",
        "timeZone": "UTC"
      },
      "end": {
        "dateTime": "#{DateTime.parse(@schedule[:start_date].to_s)+(13/24.0)}",
        "timeZone": "UTC"
      },
      "recurrence": [
        "#{rrule}"
      ],
    }
  end

  def serializeMonthlyFrequency
     numberOfEvents = ((@prescription[:quantity]/@prescription[:dosage])*(@prescription[:refills]+1)).to_i
     days = @schedule[:month_days].join(",")
     freq = "FREQ=MONTHLY;"
     count = "COUNT=#{numberOfEvents};"
     rrule = "RRULE:" + freq + count + "BYMONTHDAY=" + days

     @request_body = {
       "summary": "Prescription Reminder: #{@prescription[:name]}",
       "description": "#{@prescription[:instructions]}",
       "id": "0000#{@prescription[:id]}",

       "start": {
         "dateTime": "#{DateTime.parse(@schedule[:start_date].to_s)+(13/24.0)}",
         "timeZone": "UTC"
       },
       "end": {
         "dateTime": "#{DateTime.parse(@schedule[:start_date].to_s)+(13/24.0)}",
         "timeZone": "UTC"
       },
       "recurrence": [
         "#{rrule}"
       ],
     }
  end

  def serializeDailyFrequency
     numberOfEvents = ((@prescription[:quantity]/@prescription[:dosage])*(@prescription[:refills]+1)).to_i
     hours = @schedule[:hours].map{|h| h.hour}.sort
     freq = "FREQ=DAILY;"
     count = "COUNT=#{numberOfEvents};"
     rrule = "RRULE:" + freq + count
     @request_body = hours.map do |hour|
       {
         "summary": "Prescription Reminder: #{@prescription[:name]}",
         "description": "#{@prescription[:instructions]}",
         "id": "0000#{@prescription[:id]}#{hour}",

         "start": {
           "dateTime": "#{DateTime.parse(@schedule[:start_date].to_s)+((hour+4)/24.0)}",
           "timeZone": "UTC"
         },
         "end": {
           "dateTime": "#{DateTime.parse(@schedule[:start_date].to_s)+((hour+4)/24.0)}",
           "timeZone": "UTC"
         },
         "recurrence": [
           "#{rrule}"
         ]
      }
    end
    @request_body




  end
end
