class Forecast
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather
#add type
  def initialize(attributes)
    @id = nil
    @current_weather = create_current(attributes[:current])
    @daily_weather = create_daily(attributes[:daily]).take(5)
    @hourly_weather = create_hourly(attributes[:hourly]).take(8)
  end

  def create_current(data)
    {
      datetime: Time.at(data[:dt]).to_s,
      sunrise: Time.at(data[:sunrise]).to_s,
      sunset: Time.at(data[:sunset]).to_s,
      temperature: data[:temp].to_f.round(1),
      feels_like: data[:feels_like].to_f.round(1),
      humidity: data[:humidity],
      uvi: data[:uvi],
      visibility: data[:visibility],
      conditions: data[:weather][0][:description],
      icon: data[:weather][0][:icon]
    }
  end

  def create_daily(data)
    data.map do |day|
      {
         date: Time.at(day[:dt]).strftime("%F"),
         sunrise: Time.at(day[:sunrise]).to_s,
         sunset: Time.at(day[:sunset]).to_s,
         max_temp: day[:temp][:max].to_f.round(1),
         min_temp: day[:temp][:min].to_f.round(1),
         conditions: day[:weather][0][:description],
         icon: day[:weather][0][:icon]
      }
    end
  end

  def create_hourly(data)
    data.map do |hour|
      {
        time: Time.at(hour[:dt]).strftime("%T"),
        temperature: hour[:temp].to_f.round(1),
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
      }
    end
  end
end
