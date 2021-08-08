class ForecastFacade
  def self.get_forecast(location)
    lat_lon = GeocodeService.get_lat_long(location)
    lat = lat_lon[:results][0][:locations][0][:latLng][:lat]
    lon = lat_lon[:results][0][:locations][0][:latLng][:lng]
    forecast = WeatherService.get_forecast_data(lat, lon)
    Forecast.new(forecast)
  end
end

# 39.742043, -104.991531
