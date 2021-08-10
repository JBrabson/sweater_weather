require 'rails_helper'

RSpec.describe 'Api::V1::Breweries', type: :request do
  describe 'happy path' do
    it 'returns breweries in specified city and quantity', :vcr do
      get '/api/v1/breweries', params: {location:'denver,co', quantity: 7}
      brews_around = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(brews_around).to be_a(Hash)
      expect(brews_around).to have_key(:data)
      expect(brews_around[:data]).to be_a(Hash)
      expect(brews_around[:data]).to have_key(:id)
      expect(brews_around[:data]).to have_key(:type)

      expect(brews_around[:data]).to have_key(:attributes)
      expect(brews_around[:data][:attributes]).to be_a(Hash)
      expect(brews_around[:data][:attributes]).to have_key(:destination)

      expect(brews_around[:data][:attributes]).to have_key(:forecast)
      expect(brews_around[:data][:attributes][:forecast]).to be_a(Hash)
      expect(brews_around[:data][:attributes][:forecast]).to have_key(:summary)
      expect(brews_around[:data][:attributes][:forecast]).to have_key(:temperature)

      expect(brews_around[:data][:attributes]).to have_key(:breweries)
      expect(brews_around[:data][:attributes][:breweries]).to be_an(Array)
      expect(brews_around[:data][:attributes][:breweries].first).to be_a(Hash)
      expect(brews_around[:data][:attributes][:breweries].first).to have_key(:id)
      expect(brews_around[:data][:attributes][:breweries].first).to have_key(:name)
      expect(brews_around[:data][:attributes][:breweries].first).to have_key(:brewery_type)
    end
  end
end
