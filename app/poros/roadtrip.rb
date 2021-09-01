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
    elsif trip_route[:route][:formattedTime] == "00:00:00"
      "Mapquest unable to provide accurately calculated route; forecast may be inaccurate."
    else
      time = trip_route[:route][:formattedTime]
      hour = time.split(":")[0].to_i
      min = time.split(":")[1].to_i
      "#{hour} hours, #{min} minutes"
    end
  end

  def arrival_weather(forecast, trip_route)
    @travel_mins = (trip_route[:route][:time]) / 60
    @one_hour = 60
    @one_day = 1440
    if trip_route[:route][:routeError][:errorCode] == 2
      {}
    else
      if @travel_mins >= @one_day
        daily_forecast(forecast)
      elsif @travel_mins > @one_hour
        hourly_forecast(forecast)
      else
        forecast.current_weather
      end
    end
  end

  def hourly_forecast(forecast)
    eight_hr_threshold = 480
    if @travel_mins <= eight_hr_threshold
      index = (@travel_mins/60).round - 1
      forecast.hourly_weather[index]
    else
      "Hourly forecast range exceeded."
    end
  end
  #if hourly is over 8 - default to next day?

  def daily_forecast(forecast)
    five_day_threshold = 7200
    if @travel_mins <= five_day_threshold
      index = (@travel_mins/1440).round - 1
      forecast.daily_weather[index]
    else
      "Forecast range exceeded. Revisit us tomorrow for an additonal day's forecast."
    end
  end
end
