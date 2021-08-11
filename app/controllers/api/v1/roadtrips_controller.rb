class Api::V1::RoadtripsController < ApplicationController
  def create
    origin = params[:origin]
    destination = params[:destination]
    roadtrip = RoadtripsFacade.get_trip_summary(origin, destination)
    render json: RoadtripSerializer.new(roadtrip)
  end
end
