class BreweryFacade
  def self.get_nearby(location, quantity)
    location = location.split(',').first
    brews = BreweryService.get_breweries(location)
    breweries_list = brews.take(quantity.to_i)
  end
end
