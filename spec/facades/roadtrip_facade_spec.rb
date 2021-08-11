require 'rails_helper'

describe 'RoadtripFacade', :vcr do
  it 'returns roadtrip object for specified origin and destination', :vcr do
    origin = 'denver,co'
    destination = 'bailey,co'
    trip = RoadtripFacade.get_trip_summary(origin, destination)

    expect(trip).to be_an_instance_of(Roadtrip)
    expect(trip.id).to eq(nil)
    expect(trip.start_city).to be_a(String)
    expect(trip.end_city).to be_a(String)
    expect(trip.travel_time).to be_a(String)
    expect(trip.weather_at_eta).to be_a(Hash)
    expect(trip.weather_at_eta[:datetime]).to be_a(String)
    expect(trip.weather_at_eta[:sunrise]).to be_a(String)
    expect(trip.weather_at_eta[:sunset]).to be_a(String)
    expect(trip.weather_at_eta[:temperature]).to be_a(Float)
    expect(trip.weather_at_eta[:feels_like]).to be_a(Float)
    expect(trip.weather_at_eta[:humidity]).to be_an(Integer)
    expect(trip.weather_at_eta[:uvi]).to be_an(Integer)
    expect(trip.weather_at_eta[:visibility]).to be_an(Integer)
    expect(trip.weather_at_eta[:conditions]).to be_a(String)
    expect(trip.weather_at_eta[:icon]).to be_a(String)

    expect(trip.start_city).to eq('denver,co')
    expect(trip.end_city).to eq('bailey,co')
    expect(trip.travel_time).to eq('0 hours, 54 minutes')
    expect(trip.weather_at_eta[:datetime]).to eq('2021-08-11 00:14:17 -0600')
    expect(trip.weather_at_eta[:sunrise]).to eq('2021-08-11 03:15:46 -0600')
    expect(trip.weather_at_eta[:sunset]).to eq('2021-08-11 14:45:31 -0600')
    expect(trip.weather_at_eta[:temperature]).to eq(63.6)
    expect(trip.weather_at_eta[:feels_like]).to eq(61.9)
    expect(trip.weather_at_eta[:humidity]).to eq(49)
    expect(trip.weather_at_eta[:uvi]).to eq(0)
    expect(trip.weather_at_eta[:visibility]).to eq(10000)
    expect(trip.weather_at_eta[:conditions]).to eq('few clouds')
    expect(trip.weather_at_eta[:icon]).to eq('02n')
  end
end
