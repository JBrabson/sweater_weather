class BrewsAndSkies
  attr_reader :id,
              :destination,
              :forecast,
              :breweries

  def initialize(brewery_info, forecast)
    @id = nil
    @destination = "#{brewery_info[0][:city]}, #{brewery_info[0][:state]}"
    @forecast = forecast_stats(forecast)
    @breweries = brew_stats(brewery_info)
  end

  def forecast_stats(forecast)
    {
      summary: forecast.current_weather[:conditions],
      temperature: "#{forecast.current_weather[:temperature]} F"
    }
  end

  def brew_stats(brewery_info)
    brewery_info.map do |brewery|
    {
      id: brewery[:id],
      name: brewery[:name],
      brewery_type: brewery[:brewery_type]
    }
    end
  end
end
