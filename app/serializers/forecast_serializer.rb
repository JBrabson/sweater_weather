class ForecastSerializer
  include JSONAPI::Serializer
  attributes :current_weather, :daily_weather, :hourly_weather
  #set type - JSON doc in github
end
