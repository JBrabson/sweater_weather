class Api::V1::RoadtripsController < ApplicationController
  def create
    origin = params[:origin]
    destination = params[:destination]
    api_key = params[:api_key]
    # forecast = ForecastFacade.get_forecast(location)
    # render json: ForecastSerializer.new(forecast)
  end
end
