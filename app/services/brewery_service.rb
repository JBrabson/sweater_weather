class BreweryService
  def self.get_breweries(location)
    response = conn.get("/breweries?by_city=#{location}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.openbrewerydb.org')
  end
end
