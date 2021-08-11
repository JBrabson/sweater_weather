class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].nil?
      render json: {error: 'No search criteria entered. Please try again.'}, status: 400
    else
      location = params[:location]
      image = ImageFacade.get_image(location)
      render json: ImageSerializer.new(image)
    end
  end
end

# if image[:results] == []
#   render json: {errors: "No Images Found"}, status: :not_found
# end
