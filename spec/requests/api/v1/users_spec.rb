require 'rails_helper'

RSpec.describe 'User Create' do
  describe 'Happy Path' do
    it 'should return a valid response' do
      info = {
        'email': 'brainisgone@turingrightnow.com',
        'password': 'yeet123',
        'password_confirmation': 'yeet123'
      }

    post api_v1_users_path, params: info

    json = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:type]).to be_a(String)
    expect(json[:data][:id]).to be_a(String)
    expect(json[:data][:attributes]).to be_a(Hash)
    expect(json[:data][:attributes][:email]).to be_a(String)
    expect(json[:data][:attributes][:api_key]).to be_a(String)

    expect(json[:data][:type]).to eq('user')
    # expect(json[:data][:id]).to eq()
    expect(json[:data][:attributes][:email]).to eq(info[:email])
    # expect(json[:data][:attributes][:api_key]).to eq(info[:api_key])
    end
  end
end
