class ImageFacade
  def self.get_image(location)
    image = UnsplashService.location_image(location)
    Image.new(image, location)
  end
end
