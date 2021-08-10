class BrewsAndSkiesFacade
  def self.get_info(brewery, forecast)
    brewery_info = brewery
    forecast = forecast
    BrewsAndSkies.new(brewery_info, forecast)
  end
end
