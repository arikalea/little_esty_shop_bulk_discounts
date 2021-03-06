require './app/poros/holiday'

class HolidayService < ApiService
  def self.next_three_info
    endpoint = 'https://date.nager.at/Api/v2/NextPublicHolidays/US'
    json = get_data(endpoint)[0..2]
    json_data = Holiday.new(json).next_three_holidays
  end
end
