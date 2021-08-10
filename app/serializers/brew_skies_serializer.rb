class BrewSkiesSerializer
  include JSONAPI::Serializer
  set_type      :breweries
  attributes    :destination, :forecast, :breweries
end
