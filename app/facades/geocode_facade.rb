class GeocodeFacade
  def self.get_lat_long(destination)
    details = GeocodeService.get_location_details(destination)
    lat = details[:results][0][:locations][0][:latLng][:lat]
    lon = details[:results][0][:locations][0][:latLng][:lng]
    [lat, lon]
  end
end
