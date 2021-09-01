class Api::V1::RoadtripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    origin = params[:origin]
    destination = params[:destination]

    if origin.empty?
      render json: {error: 'Please be sure to input origin and destination fields.'}, status: 400
    elsif params[:api_key].nil? || user.nil? || params[:api_key] != user.api_key
      render json: {error: 'Not authorized.'}, status: 401
    else
      roadtrip = RoadtripFacade.get_trip_summary(origin, destination)
      render json: RoadtripSerializer.new(roadtrip)
    end
  end
end
