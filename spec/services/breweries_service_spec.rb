require 'rails_helper'

RSpec.describe 'Breweries Service' do
  it 'can search by city and return specified number of breweries', :vcr do
    location = 'denver'
    response = BreweryService.get_breweries(location)
    expect(response).to be_an(Array)

    brewery_hash = response.first
    expect(brewery_hash).to have_key(:id)
    expect(brewery_hash).to have_key(:name)
    expect(brewery_hash).to have_key(:brewery_type)

    expect(brewery_hash[:id]).to be_an(Integer)
    expect(brewery_hash[:name]).to be_a(String)
    expect(brewery_hash[:brewery_type]).to be_a(String)

    expect(brewery_hash[:id]).to eq(8039)
    expect(brewery_hash[:name]).to eq('10 Barrel Brewing Co - Denver')
    expect(brewery_hash[:brewery_type]).to eq("large")
  end
end
