class BreweriesFacade
  def self.get_nearby(location, quantity)
    location = location.split(',').first
    brews = BreweriesService.get_breweries(location)
    breweries_list = brews.take(quantity.to_i)
  end
end
