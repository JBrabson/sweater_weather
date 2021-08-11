class Api::V1::ForecastsController < ApplicationController
  def index
    location = params[:location]

    if location.nil?
      render json: {error: 'Location not provided. Please enter location to search.'}, status: 400
    else
      forecast = ForecastFacade.get_forecast(location)
      render json: ForecastSerializer.new(forecast)
    end
  end
end
