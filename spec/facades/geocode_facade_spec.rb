require 'rails_helper'

describe 'GeocodeFacade', :vcr do
  it 'returns latitude, longitude for specified location', :vcr do
    destination = 'bailey,co'
    lat_long = GeocodeFacade.get_lat_long(destination)

    expect(lat_long).to be_an(Array)
    expect(lat_long.size).to eq(2)
    expect(lat_long[0]).to be_a(Float)
    expect(lat_long[0]).to eq(39.405602)
    expect(lat_long[1]).to be_a(Float)
    expect(lat_long[1]).to eq(-105.472801)
  end
end
