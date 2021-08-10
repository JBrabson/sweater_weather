class Api::V1::BackgroundsController < ApplicationController
  def index
    location = params[:location]
    image = ImageFacade.get_image(location)
    render json: ImageSerializer.new(image)
  end
end



# if image[:results] == []
#   render json: {errors: "No Images Found"}, status: :not_found
# end
