class Api::V1::RoadtripsController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    origin = params[:origin]
    destination = params[:destination]
    roadtrip = RoadtripFacade.get_trip_summary(origin, destination)

    if params[:api_key].nil? || params[:api_key] != user.api_key
      #user.nil?
      render json: {error: 'Not authorized.'}, status: 401
    else
      render json: RoadtripSerializer.new(roadtrip)
    end
  end
end
# else
#   not possible
