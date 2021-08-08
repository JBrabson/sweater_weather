class ForecastFacade
  def self.method(location)
    lat_lon = GeocodeService.get_lat_long(location)
    binding.pry
    forecast = WeatherService.get_forecast_data(lat_lon[:lat], lat_lon[:lon])

    Forcast.new(forecast)
  end
end

# 39.742043, -104.991531
