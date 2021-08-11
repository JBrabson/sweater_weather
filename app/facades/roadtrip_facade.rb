class RoadtripFacade
  def self.get_trip_summary(origin, destination)
    destination_coords = GeocodeFacade.get_lat_long(destination)

    forecast = ForecastFacade.get_forecast(destination_coords)

    trip_route = DirectionsService.get_route_info(origin, destination)
    # travel_time = trip_route[:route][:formattedTime]
    #TODO refacotr to trip time using TripFacade.time

    Roadtrip.new(origin, destination, trip_route, forecast)
  end
end
