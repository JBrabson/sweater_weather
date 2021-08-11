require 'rails_helper'

describe 'ForecastFacade' do
  it 'returns forecast object for weather at provided location', :vcr do
    location = 'denver,co'
    forecast = ForecastFacade.get_forecast(location)

    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to eq(nil)

    expect(forecast.current_weather).to be_a(Hash)
    expect(forecast.daily_weather).to be_an(Array)
    expect(forecast.hourly_weather).to be_an(Array)
    #testing
  end
end
