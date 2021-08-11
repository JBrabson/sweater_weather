require 'rails_helper'

RSpec.describe "Api::V1::Forecasts", type: :request do
  describe "happy path" do
    it 'returns current weather and breweries of specified count based on user input', :vcr do
      location = 'denver,co'
      quantity = 2
      get '/api/v1/breweries', params: {location: location, quantity: quantity}
      brewskies = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(brewskies).to have_key(:data)
      expect(brewskies[:data]).to have_key(:id)
      expect(brewskies[:data]).to have_key(:type)
      expect(brewskies[:data]).to have_key(:attributes)

      expect(brewskies[:data][:attributes]).to have_key(:destination)
      expect(brewskies[:data][:attributes][:destination]).to be_a(String)

      expect(brewskies[:data][:attributes]).to have_key(:forecast)
      expect(brewskies[:data][:attributes][:forecast]).to be_a(Hash)
      expect(brewskies[:data][:attributes][:forecast]).to have_key(:summary)
      expect(brewskies[:data][:attributes][:forecast][:summary]).to be_a(String)
      expect(brewskies[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(brewskies[:data][:attributes][:forecast][:temperature]).to be_a(String)

      expect(brewskies[:data][:attributes]).to have_key(:breweries)
      expect(brewskies[:data][:attributes][:breweries]).to be_an(Array)
      expect(brewskies[:data][:attributes][:breweries].first).to be_a(Hash)
      expect(brewskies[:data][:attributes][:breweries].count).to eq(quantity)
      expect(brewskies[:data][:attributes][:breweries].first).to have_key(:id)
      expect(brewskies[:data][:attributes][:breweries].first).to have_key(:name)
      expect(brewskies[:data][:attributes][:breweries].first).to have_key(:brewery_type)
    end
  end
end
#sad path?
