require 'rails_helper'

RSpec.describe 'Api::V1::RoadTrip' do
  describe 'Happy Path' do
    before :each do
      @happy_user = User.create(
        email: 'happyface@emojis.com',
        password: 'yellow',
        password_confirmation: 'yellow'
      )

      @happy_user.update(api_key: SecureRandom.urlsafe_base64(24))
    end

    it 'returns road trip details based on specified start and destination points' do
      user_input = {
        origin: 'Denver,CO',
        destination: 'Nashville,TN',
        api_key: @happy_user.api_key
      }
      post '/api/v1/road_trip', params: user_input

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful

      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:start_city)
      expect(json[:data][:attributes]).to have_key(:end_city)
      expect(json[:data][:attributes]).to have_key(:travel_time)
      expect(json[:data][:attributes]).to have_key(:weather_at_eta)
      expect(json[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(json[:data][:attributes][:weather_at_eta]).to have_key(:conditions)

      expect(json[:data][:attributes]).to be_a(Hash)
      expect(json[:data][:attributes][:start_city]).to be_a(String)
      expect(json[:data][:attributes][:end_city]).to be_a(String)
      expect(json[:data][:attributes][:travel_time]).to be_a(String)
      expect(json[:data][:attributes][:weather_at_eta]).to be_a(Hash)
      expect(json[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(json[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)

      expect(json[:data][:id]).to eq(nil)
      expect(json[:data][:type]).to eq('roadtrip')
      expect(json[:data][:attributes][:start_city]).to eq(user_input[:origin])
      expect(json[:data][:attributes][:end_city]).to eq(user_input[:destination])
      # expect(json[:data][:attributes][:travel_time]).to eq(String)
      # expect(json[:data][:attributes][:weather_at_eta]).to eq(Hash)
      # expect(json[:data][:attributes][:weather_at_eta][:temperature]).to eq(Float)
      # expect(json[:data][:attributes][:weather_at_eta][:conditions]).to eq(String)
#TODO above after service/facades

    end
  end
end
