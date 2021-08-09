class Api::V1::BreweriesController < ApplicationController
  def index
    location = params[:location]
    quantity = params[:quantity]

    breweries_nearby = BreweriesFacade.get_nearby(location, quantity)
    brewery_forecast = ForecastFacade.get_forecast(location)
    brew_skies = BrewsAndSkiesFacade.get_info(breweries_nearby, brewery_forecast)
    render json: BrewSkiesSerializer.new(brew_skies)
  end
end
