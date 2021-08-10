require 'rails_helper'

RSpec.describe 'Geocode Address Service Spec' do
  it 'can search by location to return latitude/longitude coordinates', :vcr do
    location = 'Denver,CO'
    response = GeocodeService.get_lat_long(location)
    expect(response).to be_a(Hash)
    expect(response).to have_key(:results)
    expect(response[:results].first).to have_key(:locations)
    expect(response[:results].first[:locations].first).to have_key(:latLng)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end
end
