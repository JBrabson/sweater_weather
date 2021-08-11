require 'rails_helper'

RSpec.describe 'User Create' do
  describe 'Happy Path' do
    it 'should return a valid response', :vcr do
      info = {
        'email': 'brainisgone@turingrightnow.com',
        'password': 'yeet123',
        'password_confirmation': 'yeet123'
      }

      post api_v1_users_path, params: info

      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response).to have_http_status(201)

      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:api_key)

      expect(user[:data]).to be_a(Hash)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data][:id]).to be_a(String)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes][:email]).to be_a(String)
      expect(user[:data][:attributes][:api_key]).to be_a(String)

      expect(user[:data][:type]).to eq('users')
      expect(user[:data][:attributes][:email]).to eq(info[:email])
    end

    it 'creates User object' do
      info = {
        'email': 'brainisgone@turingrightnow.com',
        'password': 'yeet123',
        'password_confirmation': 'yeet123'
      }

      post api_v1_users_path, params: info
      user = JSON.parse(response.body, symbolize_names: true)
      user_obj = User.find_by(email: info[:email])

        expect(user_obj).to be_an_instance_of(User)
        expect(user_obj.id).to eq(User.all.last.id)
        expect(user_obj.email).to eq(user[:data][:attributes][:email])
        expect(user_obj.api_key).to eq(user[:data][:attributes][:api_key])
    end
  end

  describe 'Sad Path' do

    it 'returns error if field missing' do
      info = {
        'email': nil,
        'password': 'yeet123',
        'password_confirmation': 'yeet123'
      }

      post api_v1_users_path, params: info
      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(user[:error]).to eq('Missing field. Please provide all info and try again.')
    end
    #TODO edgecase with tailored error for each missing field
    xit 'returns error if email has been taken' do
    end

    it 'returns error if password and password confirmation do not match' do
      info = {
        'email': nil,
        'password': 'yeet123',
        'password_confirmation': 'yeet321'
      }

      post api_v1_users_path, params: info
      user = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(user[:error]).to eq('Password and Password Confirmation do not match. Please try again.')
    end
  end
end
