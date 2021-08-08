require 'rails_helper'

RSpec.describe 'Unsplash Service Spec' do
  it 'can search for background images based on location search params' do
    location = 'Denver,CO'
    VCR.use_cassette("get_image") do
      response = UnsplashService.location_image(location)

      expect(response).to be_a(Hash)
      #Below: how to assert hash count to 1?
      # expect(response.count).to eq(1)
      expect(response).to have_key(:alt_description)
      expect(response[:urls]).to have_key(:full)
      expect(response[:user]).to have_key(:name)
      expect(response[:user]).to have_key(:portfolio_url)
    end
  end
end
