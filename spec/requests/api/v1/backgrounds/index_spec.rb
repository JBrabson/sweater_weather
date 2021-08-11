require 'rails_helper'

RSpec.describe 'Backgrounds Index API' do
  describe 'Happy Path' do
    it 'will return image based on location specified, with no unneccesary attributes', :vcr do
      location = 'denver,co'
      get "/api/v1/backgrounds?location=#{location}"

      image = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response).to have_http_status(200)

      expect(image).to be_a(Hash)
      expect(image[:data]).to be_a(Hash)
      expect(image[:data][:attributes]).to be_a(Hash)
      expect(image[:data][:attributes][:image]).to be_a(Hash)
      expect(image[:data][:attributes][:image][:location]).to be_a(String)
      expect(image[:data][:attributes][:image][:image_url]).to be_a(String)
      expect(image[:data][:attributes][:image][:credit]).to be_a(Hash)
      expect(image[:data][:attributes][:image][:credit][:source]).to be_a(String)
      expect(image[:data][:attributes][:image][:credit][:author]).to be_a(String)
      expect(image[:data][:attributes][:image][:credit][:portfolio_url]).to be_a(String)
      expect(image[:data][:attributes][:image][:credit][:logo]).to be_a(String)

      expect(image[:data].count).to eq(3)
      expect(image[:data][:attributes].count).to eq(1)
      expect(image[:data][:attributes][:image].count).to eq(3)
      expect(image[:data][:attributes][:image][:credit].count).to eq(4)

      expect(image).to have_key(:data)
      expect(image[:data]).to have_key(:id)
      expect(image[:data]).to have_key(:type)
      expect(image[:data]).to have_key(:attributes)

      expect(image[:data][:attributes]).to have_key(:image)

      expect(image[:data][:attributes][:image]).to have_key(:location)
      expect(image[:data][:attributes][:image]).to have_key(:image_url)
      expect(image[:data][:attributes][:image]).to have_key(:credit)

      expect(image[:data][:attributes][:image][:credit]).to have_key(:source)
      expect(image[:data][:attributes][:image][:credit]).to have_key(:author)
      expect(image[:data][:attributes][:image][:credit]).to have_key(:portfolio_url)
      expect(image[:data][:attributes][:image][:credit]).to have_key(:logo)

      expect(image[:data][:id]).to be(nil)
      expect(image[:data][:type]).to eq('image')
      expect(image[:data][:attributes][:image][:location]).to eq(location)
      expect(image[:data][:attributes][:image][:image_url]).to eq('https://images.unsplash.com/photo-1614057695473-108bafc8d791?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTIyNzl8MHwxfHJhbmRvbXx8fHx8fHx8fDE2Mjg2NTk5MDE&ixlib=rb-1.2.1&q=85')
      expect(image[:data][:attributes][:image][:credit][:source]).to eq('https://unsplash.com')
      expect(image[:data][:attributes][:image][:credit][:author]).to eq('Frankie Lopez')
      expect(image[:data][:attributes][:image][:credit][:portfolio_url]).to eq('https://api.unsplash.com/users/frankielopez/portfolio')
      expect(image[:data][:attributes][:image][:credit][:logo]).to eq('https://unsplash.com/blog/content/images/max/2560/1-ElwDA92icHLARE8v2HevvA.jpeg')
    end
  end
end
