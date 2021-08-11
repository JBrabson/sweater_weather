require 'rails_helper'

RSpec.describe 'Mapquest Directions API' do
  it 'can return trip route based on specified origin and destination' do
    params = {
      from: 'Denver, CO',
      to: 'Nashville,TN'
    }
# edgecase for no spaces?
    response = DirectionsService.get_route_info(params[:from], params[:to])

    expect(response).to have_key(:route)
    expect(response[:route]).to have_key(:formattedTime)

    expect(response).to be_a(Hash)
    expect(response[:route][:formattedTime]).to be_a(String)

    expect(response[:route][:formattedTime]).to eq('16:42:56')
#TODO limit response to needed data
  end
end
# it 'can search by location to return latitude/longitude coordinates', :vcr do
#   location = 'Denver,CO'
#   response = GeocodeService.get_lat_long(location)
#   expect(response).to be_a(Hash)
#   expect(response).to have_key(:results)
#   expect(response[:results].first).to have_key(:locations)
#   expect(response[:results].first[:locations].first).to have_key(:latLng)
#   expect(response[:results].first[:locations].first[:latLng]).to have_key(:lat)
#   expect(response[:results].first[:locations].first[:latLng]).to have_key(:lng)
# end
# end
