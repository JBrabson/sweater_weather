class ForecastFacade
  def self.get_forecast(location)
    lat_lon = GeocodeFacade.get_lat_long(location)
    lat = lat_lon[0]
    lon = lat_lon[1]
    forecast = WeatherService.get_forecast_data(lat, lon)
    Forecast.new(forecast)
  end
end
