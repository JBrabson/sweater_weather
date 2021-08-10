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

    end
  end
end
