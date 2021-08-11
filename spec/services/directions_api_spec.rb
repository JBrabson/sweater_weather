require 'rails_helper'

RSpec.describe 'Mapquest Directions API' do
  it 'can return trip route based on specified origin and destination', :vcr do
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
