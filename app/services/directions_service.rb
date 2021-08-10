class DirectionsService
  def self.get_directions(origin, destination)
    response = conn.get("/directions/v2/route?from=#{origin}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://open.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['GEO_API_KEY']
    end
  end
end
