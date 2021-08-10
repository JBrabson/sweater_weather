require 'rails_helper'

RSpec.describe 'Unsplash Service Spec' do
  it 'can search for background images based on location search params', :vcr do
      location = 'denver,co'
      image_info = UnsplashService.location_image(location)

      expect(image_info).to be_a(Hash)
      #Below: how to assert hash count to 1?
      # expect(response.count).to eq(1)
      expect(image_info).to have_key(:description)
      expect(image_info[:urls]).to have_key(:full)
      expect(image_info[:user]).to have_key(:name)
      expect(image_info[:user][:links]).to have_key(:portfolio)
  end
end
#change params to lower case
