require 'rails_helper'

RSpec.describe 'Weather Service Spec' do
  it 'will return hourly/daily and current weather for provided location', :vcr do
    response = WeatherService.get_forecast_data(39.742043, -104.991531)
    expect(response).to be_a(Hash)
    expect(response[:current]).to be_a(Hash)
    expect(response[:daily]).to be_a(Array)
    expect(response[:hourly]).to be_a(Array)

    expect(response).to have_key(:current)
    expect(response).to have_key(:daily)
    expect(response).to have_key(:hourly)

    expect(response).to_not have_key(:minutely)
    expect(response).to_not have_key(:alerts)
  end
end
