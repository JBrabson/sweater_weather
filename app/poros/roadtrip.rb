class Roadtrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta
              
  def initialize(origin, destination, trip_route, forecast)
    @id = nil
    @start_city = origin
    @end_city = destination
    @travel_time = format_time(trip_route)
    @weather_at_eta = arrival_weather(forecast, trip_route)
  end

  def format_time(trip_route)
    if trip_route[:route][:routeError][:errorCode] == 2
      "impossible"
    else
      @travel_mins = trip_route[:route][:time]/60
      time = trip_route[:route][:formattedTime]
      hour = time.split(":")[0].to_i
      min = time.split(":")[1].to_i
      "#{hour} hours, #{min} minutes"
    end
  end

  def arrival_weather(forecast, trip_route)
    if trip_route[:route][:routeError][:errorCode] == 2
      {}
    else
      one_hour = 60
      one_day = 1440
      if @travel_mins > one_hour
        hourly_forecast(forecast)
      elsif @travel_mins >= one_day
        daily_forecast(forecast)
      else
        forecast.current_weather
      end
    end
  end

  def hourly_forecast(forecast)
    if @travel_mins < 60
      forecast.current_weather
    elsif @travel_mins < 120
      forecast.hourly_weather[0]
    elsif @travel_mins < 180
      forecast.hourly_weather[1]
    elsif @travel_mins < 240
      forecast.hourly_weather[2]
    elsif @travel_mins < 300
      forecast.hourly_weather[3]
    elsif @travel_mins < 360
      forecast.hourly_weather[4]
    elsif @travel_mins < 420
      forecast.hourly_weather[5]
    elsif @travel_mins < 480
      forecast.hourly_weather[6]
    elsif @travel_mins < 540
      forecast.hourly_weather[7]
    else
      "Hourly range exceeded. Take a look at the daily forecast."
    end
  end

  def daily_forecast(forecast)
    if @travel_mins >= 1440
      forecast.daily_weather[0]
    elsif @travel_mins >= 2880
      forecast.daily_weather[1]
    elsif @travel_mins >= 4320
      forecast.daily_weather[2]
    elsif @travel_mins >= 5760
      forecast.daily_weather[3]
    elsif @travel_mins >= 7200
      forecast.daily_weather[4]
    else
      "Forecast range exceeded. Revisit us tomorrow for an additonal day's forecast."
    end
  end
end
