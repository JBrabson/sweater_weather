class WeatherService
  def self.get_forecast_data(lat, lon)
    response = conn.get("/data/2.5/onecall?lat=#{lat}&lon=#{lon}")
      parse_json(response)
  end

    private

    def self.conn
      Faraday.new(url: 'https://api.openweathermap.org') do |faraday|
        faraday.params['exclude'] = 'minutely,alerts'
        faraday.params['units'] = 'imperial'
        faraday.params['appid'] = ENV['FORECAST_API']
      end
    end

    def self.parse_json(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
