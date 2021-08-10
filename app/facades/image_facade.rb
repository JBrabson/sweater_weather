class ImageFacade
  def self.get_image(location)
    image = UnsplashService.location_image(location)
    Background.new(image, location)
  end
end
