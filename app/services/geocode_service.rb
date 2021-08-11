class GeocodeService
  def self.get_location_details(location)
    response = conn.get("/geocoding/v1/address?location=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MQ_API_KEY']
      faraday.params['maxResults'] = 1
    end
  end
end
