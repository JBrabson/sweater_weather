require 'rails_helper'

RSpec.describe 'Sessions' do
  before :each do
    @user = User.create(
      email: 'feedmetacos@tuesday.com',
      password: 'sriracha',
      password_confirmation: 'sriracha'
    )
  end
#TODO fix testing; passing in postman - error in rspec
  describe 'Happy Path' do
    it 'create new session with valid params' do
      input = {
        "email": "#{@user.email}",
        "password": "#{@user.password}"
      }

      post api_v1_sessions_path, params: input

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(200)
      expect(json[:data]).to have_key(:type)
      expect(json[:data]).to have_key(:id)
      expect(json[:data]).to have_key(:attributes)
      expect(json[:data][:attributes]).to have_key(:email)
      expect(json[:data][:attributes]).to have_key(:api_key)

      expect(json[:data][:type]).to be_a(String)
      expect(json[:data][:id]).to be_a(String)
      expect(json[:data][:attribtures]).to be_a(Hash)
      expect(json[:data][:attribtures][:email]).to be_a(String)
      expect(json[:data][:attribtures][:api_key]).to be_a(String)

      expect(json[:data][:type]).to eq('users')
      expect(json[:data][:id]).to eq(@user.id)
      expect(json[:data][:attributes][:email]).to eq(@user.email)
      expect(json[:data][:attributes][:api_key]).to eq(@user.api_key)
    end
  end
end
