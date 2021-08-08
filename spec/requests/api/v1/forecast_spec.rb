require 'rails_helper'

RSpec.describe "Api::V1::Forecasts", type: :request do
  describe "happy path" do
    it '' do
      get "/api/v1/forecast?location=denver,co"

      expect(response).to be_successful
      forecast = JSON.parse(response.body, symbolize_names: true)
      #  pry
      # expect(forecast).to have_key(:data)
      #
      # expect(forecast).to be_a()
      #
      # expect(forecast.count).to be_a()
    end
  end
end
