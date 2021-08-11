class DirectionsService
  def self.get_route_info(origin, destination)
    response = conn.get("/directions/v2/route?from=#{origin}&to=#{destination}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'http://open.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MQ_API_KEY']
    end
  end
end
#TO DO rename geo api key
