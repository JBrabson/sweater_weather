require 'rails_helper'

describe Forecast do
  before :each do
    @forecast = Forecast.new(info)
  end

  describe 'Current Weather' do
    it 'is a hash and contains current weather stats' do
      expect(@forecast).to be_a(Forecast)
      expect(@forecast.id).to eq(nil)
      expect(@forecast.current_weather).to have_key(:datetime)
      expect(@forecast.current_weather).to have_key(:sunrise)
      expect(@forecast.current_weather).to have_key(:sunset)
      expect(@forecast.current_weather).to have_key(:temperature)
      expect(@forecast.current_weather).to have_key(:feels_like)
      expect(@forecast.current_weather).to have_key(:humidity)
      expect(@forecast.current_weather).to have_key(:uvi)
      expect(@forecast.current_weather).to have_key(:visibility)
      expect(@forecast.current_weather).to have_key(:conditions)
      expect(@forecast.current_weather).to have_key(:icon)

      expect(@forecast.current_weather).to be_a(Hash)
      expect(@forecast.current_weather[:datetime]).to be_a(String)
      expect(@forecast.current_weather[:sunrise]).to be_a(String)
      expect(@forecast.current_weather[:sunset]).to be_a(String)
      expect(@forecast.current_weather[:temperature]).to be_a(Float)
      expect(@forecast.current_weather[:feels_like]).to be_a(Float)
      expect(@forecast.current_weather[:humidity]).to be_a(Integer)
      expect(@forecast.current_weather[:uvi]).to be_a(Float)
      expect(@forecast.current_weather[:visibility]).to be_a(Integer)
      expect(@forecast.current_weather[:conditions]).to be_a(String)
      expect(@forecast.current_weather[:icon]).to be_a(String)

      expect(@forecast.current_weather[:datetime]).to eq("2021-08-07 13:56:43 -0600")
      expect(@forecast.current_weather[:sunrise]).to eq("2021-08-07 06:04:50 -0600")
      expect(@forecast.current_weather[:sunset]).to eq("2021-08-07 20:06:35 -0600")
      expect(@forecast.current_weather[:temperature]).to eq(81.77)
      expect(@forecast.current_weather[:feels_like]).to eq(80.26)
      expect(@forecast.current_weather[:humidity]).to eq(29)
      expect(@forecast.current_weather[:uvi]).to eq(8.42)
      expect(@forecast.current_weather[:visibility]).to eq(10000)
      expect(@forecast.current_weather[:conditions]).to eq("few clouds")
      expect(@forecast.current_weather[:icon]).to eq("02d")
    end
  end

  describe 'Daily Weather' do
    it 'is an array and contains weather stats for next five days' do
      expect(@forecast.daily_weather.count).to eq(5)
      day = @forecast.daily_weather.first
        expect(day).to have_key(:date)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:max_temp)
        expect(day).to have_key(:min_temp)
        expect(day).to have_key(:conditions)
        expect(day).to have_key(:icon)

        expect(day[:date]).to be_a(String)
        expect(day[:sunrise]).to be_a(String)
        expect(day[:sunset]).to be_a(String)
        expect(day[:max_temp]).to be_a(Float)
        expect(day[:min_temp]).to be_a(Float)
        expect(day[:conditions]).to be_a(String)
        expect(day[:icon]).to be_a(String)

        expect(day[:date]).to eq('2021-08-07')
        expect(day[:sunrise]).to eq('2021-08-07 06:04:50 -0600')
        expect(day[:sunset]).to eq('2021-08-07 20:06:35 -0600')
        expect(day[:max_temp]).to eq(86.63)
        expect(day[:min_temp]).to eq(68.9)
        expect(day[:conditions]).to eq('few clouds')
        expect(day[:icon]).to eq('02d')
        #test for diff between 1st and 5th
    end
  end

  describe "Hourly Weather" do
    it 'is an array and contains weather stats for next 8 hours' do
      expect(@forecast.hourly_weather.count).to eq(8)
      hour = @forecast.hourly_weather.first
        expect(hour).to have_key(:time)
        expect(hour).to have_key(:temperature)
        expect(hour).to have_key(:conditions)
        expect(hour).to have_key(:icon)

        expect(hour[:time]).to be_a(String)
        expect(hour[:temperature]).to be_a(Float)
        expect(hour[:conditions]).to be_a(String)
        expect(hour[:icon]).to be_a(String)

        expect(hour[:time]).to eq('13:00:00')
        expect(hour[:temperature]).to eq(82.42)
        expect(hour[:conditions]).to eq('few clouds')
        expect(hour[:icon]).to eq('02d')
    end
  end

end
