require 'simplecov'
SimpleCov.start
# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'
require 'rspec/autorun'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include FactoryBot::Syntax::Methods
  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end

  VCR.configure do |config|
    config.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
    config.hook_into :webmock
    config.default_cassette_options = { re_record_interval: 30.days }
    config.allow_http_connections_when_no_cassette = true
    config.configure_rspec_metadata!
  end
end

def info
  {
    "lat": 39.742,
    "lon": -104.9915,
    "timezone": "America/Denver",
    "timezone_offset": -21600,
    "current": {
        "dt": 1628366203,
        "sunrise": 1628337890,
        "sunset": 1628388395,
        "temp": 81.77,
        "feels_like": 80.26,
        "pressure": 1007,
        "humidity": 29,
        "dew_point": 46.45,
        "uvi": 8.42,
        "clouds": 11,
        "visibility": 10000,
        "wind_speed": 1.99,
        "wind_deg": 180,
        "wind_gust": 3,
        "weather": [
            {
                "id": 801,
                "main": "Clouds",
                "description": "few clouds",
                "icon": "02d"
            }
        ]
    },
    "hourly": [
        {
            "dt": 1628362800,
            "temp": 82.42,
            "feels_like": 80.49,
            "pressure": 1007,
            "humidity": 26,
            "dew_point": 44.13,
            "uvi": 9.04,
            "clouds": 11,
            "visibility": 10000,
            "wind_speed": 8.97,
            "wind_deg": 65,
            "wind_gust": 12.28,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0.08
        },
        {
            "dt": 1628366400,
            "temp": 81.77,
            "feels_like": 80.26,
            "pressure": 1007,
            "humidity": 29,
            "dew_point": 46.45,
            "uvi": 8.42,
            "clouds": 11,
            "visibility": 10000,
            "wind_speed": 8.63,
            "wind_deg": 29,
            "wind_gust": 14.38,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0.04
        },
        {
            "dt": 1628370000,
            "temp": 83.21,
            "feels_like": 80.98,
            "pressure": 1007,
            "humidity": 25,
            "dew_point": 43.77,
            "uvi": 6.77,
            "clouds": 11,
            "visibility": 10000,
            "wind_speed": 9.28,
            "wind_deg": 354,
            "wind_gust": 15.41,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0.04
        },
        {
            "dt": 1628373600,
            "temp": 84.72,
            "feels_like": 81.88,
            "pressure": 1006,
            "humidity": 21,
            "dew_point": 40.51,
            "uvi": 4.87,
            "clouds": 18,
            "visibility": 10000,
            "wind_speed": 16.15,
            "wind_deg": 329,
            "wind_gust": 19.1,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "pop": 0.04
        },
        {
            "dt": 1628377200,
            "temp": 85.69,
            "feels_like": 82.49,
            "pressure": 1006,
            "humidity": 18,
            "dew_point": 37.36,
            "uvi": 2.67,
            "clouds": 30,
            "visibility": 10000,
            "wind_speed": 17.4,
            "wind_deg": 320,
            "wind_gust": 19.95,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "pop": 0.04
        },
        {
            "dt": 1628380800,
            "temp": 86.63,
            "feels_like": 83.16,
            "pressure": 1005,
            "humidity": 15,
            "dew_point": 33.53,
            "uvi": 1.07,
            "clouds": 34,
            "visibility": 10000,
            "wind_speed": 14.85,
            "wind_deg": 312,
            "wind_gust": 18.16,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628384400,
            "temp": 86.36,
            "feels_like": 82.92,
            "pressure": 1006,
            "humidity": 13,
            "dew_point": 29.79,
            "uvi": 0.26,
            "clouds": 4,
            "visibility": 10000,
            "wind_speed": 12.68,
            "wind_deg": 316,
            "wind_gust": 15.61,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628388000,
            "temp": 82.81,
            "feels_like": 80.28,
            "pressure": 1007,
            "humidity": 16,
            "dew_point": 32.65,
            "uvi": 0,
            "clouds": 2,
            "visibility": 10000,
            "wind_speed": 11.01,
            "wind_deg": 343,
            "wind_gust": 17.02,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628391600,
            "temp": 78.17,
            "feels_like": 76.86,
            "pressure": 1009,
            "humidity": 25,
            "dew_point": 39.25,
            "uvi": 0,
            "clouds": 2,
            "visibility": 10000,
            "wind_speed": 9.15,
            "wind_deg": 31,
            "wind_gust": 15.3,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628395200,
            "temp": 77.41,
            "feels_like": 76.08,
            "pressure": 1010,
            "humidity": 26,
            "dew_point": 40.1,
            "uvi": 0,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 5.21,
            "wind_deg": 37,
            "wind_gust": 11.79,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628398800,
            "temp": 76.3,
            "feels_like": 74.89,
            "pressure": 1010,
            "humidity": 27,
            "dew_point": 39.85,
            "uvi": 0,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 2.13,
            "wind_deg": 120,
            "wind_gust": 4.81,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628402400,
            "temp": 75.29,
            "feels_like": 73.83,
            "pressure": 1011,
            "humidity": 28,
            "dew_point": 39.38,
            "uvi": 0,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 4.7,
            "wind_deg": 208,
            "wind_gust": 7.74,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628406000,
            "temp": 74.01,
            "feels_like": 72.37,
            "pressure": 1011,
            "humidity": 27,
            "dew_point": 37.96,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.59,
            "wind_deg": 225,
            "wind_gust": 10.04,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628409600,
            "temp": 72.81,
            "feels_like": 71.01,
            "pressure": 1010,
            "humidity": 26,
            "dew_point": 36.27,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.21,
            "wind_deg": 216,
            "wind_gust": 9.01,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628413200,
            "temp": 71.49,
            "feels_like": 69.6,
            "pressure": 1010,
            "humidity": 27,
            "dew_point": 35.6,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.79,
            "wind_deg": 199,
            "wind_gust": 10.11,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628416800,
            "temp": 70.47,
            "feels_like": 68.49,
            "pressure": 1010,
            "humidity": 27,
            "dew_point": 35.1,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 6.15,
            "wind_deg": 201,
            "wind_gust": 11.1,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628420400,
            "temp": 69.42,
            "feels_like": 67.39,
            "pressure": 1010,
            "humidity": 28,
            "dew_point": 34.7,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.53,
            "wind_deg": 202,
            "wind_gust": 10.09,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628424000,
            "temp": 68.79,
            "feels_like": 66.74,
            "pressure": 1010,
            "humidity": 29,
            "dew_point": 34.65,
            "uvi": 0,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.12,
            "wind_deg": 207,
            "wind_gust": 8.97,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628427600,
            "temp": 69.6,
            "feels_like": 67.59,
            "pressure": 1011,
            "humidity": 28,
            "dew_point": 34.79,
            "uvi": 0.27,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.39,
            "wind_deg": 209,
            "wind_gust": 8.59,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628431200,
            "temp": 73.38,
            "feels_like": 71.6,
            "pressure": 1011,
            "humidity": 25,
            "dew_point": 34.74,
            "uvi": 1.1,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.3,
            "wind_deg": 214,
            "wind_gust": 7.25,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628434800,
            "temp": 78.26,
            "feels_like": 76.77,
            "pressure": 1010,
            "humidity": 21,
            "dew_point": 34.68,
            "uvi": 2.73,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 4.56,
            "wind_deg": 214,
            "wind_gust": 6.29,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628438400,
            "temp": 82.74,
            "feels_like": 80.26,
            "pressure": 1009,
            "humidity": 17,
            "dew_point": 34.11,
            "uvi": 5.04,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 3.53,
            "wind_deg": 209,
            "wind_gust": 5.28,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628442000,
            "temp": 86.88,
            "feels_like": 83.35,
            "pressure": 1008,
            "humidity": 15,
            "dew_point": 33.24,
            "uvi": 7.46,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 2.19,
            "wind_deg": 195,
            "wind_gust": 4.09,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628445600,
            "temp": 88.81,
            "feels_like": 84.9,
            "pressure": 1007,
            "humidity": 13,
            "dew_point": 32.13,
            "uvi": 9.3,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 4.12,
            "wind_deg": 130,
            "wind_gust": 6.64,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628449200,
            "temp": 90.23,
            "feels_like": 86.09,
            "pressure": 1006,
            "humidity": 12,
            "dew_point": 31.21,
            "uvi": 9.94,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 7.47,
            "wind_deg": 116,
            "wind_gust": 11.39,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628452800,
            "temp": 91.72,
            "feels_like": 87.37,
            "pressure": 1005,
            "humidity": 11,
            "dew_point": 30.97,
            "uvi": 9.25,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 9.13,
            "wind_deg": 116,
            "wind_gust": 14.18,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628456400,
            "temp": 93.07,
            "feels_like": 88.54,
            "pressure": 1004,
            "humidity": 11,
            "dew_point": 30.85,
            "uvi": 7.42,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 9.26,
            "wind_deg": 114,
            "wind_gust": 12.12,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628460000,
            "temp": 93.67,
            "feels_like": 89.06,
            "pressure": 1004,
            "humidity": 11,
            "dew_point": 30.81,
            "uvi": 5.06,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 8.14,
            "wind_deg": 108,
            "wind_gust": 10.25,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628463600,
            "temp": 93.67,
            "feels_like": 89.06,
            "pressure": 1003,
            "humidity": 11,
            "dew_point": 30.83,
            "uvi": 2.76,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 7.36,
            "wind_deg": 111,
            "wind_gust": 11.32,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628467200,
            "temp": 93.4,
            "feels_like": 88.83,
            "pressure": 1003,
            "humidity": 11,
            "dew_point": 31.14,
            "uvi": 1.09,
            "clouds": 5,
            "visibility": 10000,
            "wind_speed": 7.4,
            "wind_deg": 141,
            "wind_gust": 10.07,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628470800,
            "temp": 91.58,
            "feels_like": 87.3,
            "pressure": 1003,
            "humidity": 13,
            "dew_point": 33.01,
            "uvi": 0.27,
            "clouds": 80,
            "visibility": 10000,
            "wind_speed": 11.34,
            "wind_deg": 159,
            "wind_gust": 8.99,
            "weather": [
                {
                    "id": 803,
                    "main": "Clouds",
                    "description": "broken clouds",
                    "icon": "04d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628474400,
            "temp": 87.64,
            "feels_like": 84.04,
            "pressure": 1004,
            "humidity": 17,
            "dew_point": 36.81,
            "uvi": 0,
            "clouds": 43,
            "visibility": 10000,
            "wind_speed": 11.05,
            "wind_deg": 184,
            "wind_gust": 16.98,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628478000,
            "temp": 84.04,
            "feels_like": 81.41,
            "pressure": 1006,
            "humidity": 22,
            "dew_point": 40.37,
            "uvi": 0,
            "clouds": 31,
            "visibility": 10000,
            "wind_speed": 7.9,
            "wind_deg": 181,
            "wind_gust": 18.92,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628481600,
            "temp": 82.36,
            "feels_like": 80.26,
            "pressure": 1006,
            "humidity": 23,
            "dew_point": 40.42,
            "uvi": 0,
            "clouds": 25,
            "visibility": 10000,
            "wind_speed": 4.18,
            "wind_deg": 188,
            "wind_gust": 6.98,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628485200,
            "temp": 80.82,
            "feels_like": 79.25,
            "pressure": 1007,
            "humidity": 23,
            "dew_point": 39.9,
            "uvi": 0,
            "clouds": 21,
            "visibility": 10000,
            "wind_speed": 4.61,
            "wind_deg": 222,
            "wind_gust": 7.43,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628488800,
            "temp": 79.21,
            "feels_like": 79.21,
            "pressure": 1007,
            "humidity": 23,
            "dew_point": 37.71,
            "uvi": 0,
            "clouds": 18,
            "visibility": 10000,
            "wind_speed": 5.21,
            "wind_deg": 230,
            "wind_gust": 8.5,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628492400,
            "temp": 77.65,
            "feels_like": 76.15,
            "pressure": 1007,
            "humidity": 22,
            "dew_point": 35.49,
            "uvi": 0,
            "clouds": 6,
            "visibility": 10000,
            "wind_speed": 5.57,
            "wind_deg": 223,
            "wind_gust": 9.22,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628496000,
            "temp": 76.6,
            "feels_like": 74.95,
            "pressure": 1007,
            "humidity": 21,
            "dew_point": 33.01,
            "uvi": 0,
            "clouds": 6,
            "visibility": 10000,
            "wind_speed": 5.79,
            "wind_deg": 218,
            "wind_gust": 9.19,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628499600,
            "temp": 75.52,
            "feels_like": 73.76,
            "pressure": 1008,
            "humidity": 21,
            "dew_point": 32.11,
            "uvi": 0,
            "clouds": 6,
            "visibility": 10000,
            "wind_speed": 5.88,
            "wind_deg": 211,
            "wind_gust": 9.28,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628503200,
            "temp": 74.52,
            "feels_like": 72.66,
            "pressure": 1008,
            "humidity": 21,
            "dew_point": 31.89,
            "uvi": 0,
            "clouds": 6,
            "visibility": 10000,
            "wind_speed": 5.95,
            "wind_deg": 207,
            "wind_gust": 9.57,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628506800,
            "temp": 73.65,
            "feels_like": 71.74,
            "pressure": 1008,
            "humidity": 22,
            "dew_point": 32,
            "uvi": 0,
            "clouds": 6,
            "visibility": 10000,
            "wind_speed": 6.04,
            "wind_deg": 207,
            "wind_gust": 10.2,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628510400,
            "temp": 72.95,
            "feels_like": 70.99,
            "pressure": 1009,
            "humidity": 22,
            "dew_point": 31.96,
            "uvi": 0,
            "clouds": 5,
            "visibility": 10000,
            "wind_speed": 5.35,
            "wind_deg": 217,
            "wind_gust": 9.24,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01n"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628514000,
            "temp": 73.65,
            "feels_like": 71.74,
            "pressure": 1010,
            "humidity": 22,
            "dew_point": 32.2,
            "uvi": 0.27,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 4.83,
            "wind_deg": 214,
            "wind_gust": 7.94,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628517600,
            "temp": 77.5,
            "feels_like": 75.85,
            "pressure": 1009,
            "humidity": 19,
            "dew_point": 32.25,
            "uvi": 1.11,
            "clouds": 1,
            "visibility": 10000,
            "wind_speed": 5.48,
            "wind_deg": 208,
            "wind_gust": 7.25,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628521200,
            "temp": 82.8,
            "feels_like": 80.28,
            "pressure": 1009,
            "humidity": 16,
            "dew_point": 31.68,
            "uvi": 2.78,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.5,
            "wind_deg": 198,
            "wind_gust": 6.69,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628524800,
            "temp": 88.23,
            "feels_like": 84.43,
            "pressure": 1008,
            "humidity": 12,
            "dew_point": 29.77,
            "uvi": 5.09,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 4.14,
            "wind_deg": 211,
            "wind_gust": 7.63,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628528400,
            "temp": 92.91,
            "feels_like": 88.38,
            "pressure": 1007,
            "humidity": 9,
            "dew_point": 26.69,
            "uvi": 7.54,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 1.66,
            "wind_deg": 171,
            "wind_gust": 6.35,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        },
        {
            "dt": 1628532000,
            "temp": 94.08,
            "feels_like": 89.37,
            "pressure": 1006,
            "humidity": 8,
            "dew_point": 25.32,
            "uvi": 9.41,
            "clouds": 0,
            "visibility": 10000,
            "wind_speed": 5.57,
            "wind_deg": 134,
            "wind_gust": 11.97,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "pop": 0
        }
    ],
    "daily": [
        {
            "dt": 1628362800,
            "sunrise": 1628337890,
            "sunset": 1628388395,
            "moonrise": 1628333400,
            "moonset": 1628388300,
            "moon_phase": 0.97,
            "temp": {
                "day": 82.42,
                "min": 68.9,
                "max": 86.63,
                "night": 76.3,
                "eve": 86.36,
                "morn": 70
            },
            "feels_like": {
                "day": 80.49,
                "night": 74.89,
                "eve": 82.92,
                "morn": 68.49
            },
            "pressure": 1007,
            "humidity": 26,
            "dew_point": 44.13,
            "wind_speed": 17.4,
            "wind_deg": 320,
            "wind_gust": 20.83,
            "weather": [
                {
                    "id": 801,
                    "main": "Clouds",
                    "description": "few clouds",
                    "icon": "02d"
                }
            ],
            "clouds": 11,
            "pop": 0.16,
            "uvi": 9.04
        },
        {
            "dt": 1628449200,
            "sunrise": 1628424347,
            "sunset": 1628474724,
            "moonrise": 1628423700,
            "moonset": 1628476860,
            "moon_phase": 0,
            "temp": {
                "day": 90.23,
                "min": 68.79,
                "max": 93.67,
                "night": 80.82,
                "eve": 91.58,
                "morn": 69.6
            },
            "feels_like": {
                "day": 86.09,
                "night": 79.25,
                "eve": 87.3,
                "morn": 67.59
            },
            "pressure": 1006,
            "humidity": 12,
            "dew_point": 31.21,
            "wind_speed": 11.34,
            "wind_deg": 159,
            "wind_gust": 18.92,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 9.94
        },
        {
            "dt": 1628535600,
            "sunrise": 1628510805,
            "sunset": 1628561052,
            "moonrise": 1628514120,
            "moonset": 1628565180,
            "moon_phase": 0.04,
            "temp": {
                "day": 95.52,
                "min": 72.95,
                "max": 96.42,
                "night": 79.18,
                "eve": 90.63,
                "morn": 73.65
            },
            "feels_like": {
                "day": 90.59,
                "night": 79.18,
                "eve": 86.45,
                "morn": 71.74
            },
            "pressure": 1005,
            "humidity": 8,
            "dew_point": 24.91,
            "wind_speed": 14.99,
            "wind_deg": 188,
            "wind_gust": 15.77,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 6,
            "pop": 0.04,
            "uvi": 9.41
        },
        {
            "dt": 1628622000,
            "sunrise": 1628597262,
            "sunset": 1628647378,
            "moonrise": 1628604600,
            "moonset": 1628653260,
            "moon_phase": 0.07,
            "temp": {
                "day": 91.13,
                "min": 73.17,
                "max": 94.91,
                "night": 83.7,
                "eve": 90.52,
                "morn": 73.17
            },
            "feels_like": {
                "day": 86.9,
                "night": 81.16,
                "eve": 86.43,
                "morn": 71.4
            },
            "pressure": 1011,
            "humidity": 13,
            "dew_point": 33.78,
            "wind_speed": 9.91,
            "wind_deg": 230,
            "wind_gust": 15.46,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 2,
            "pop": 0,
            "uvi": 10.19
        },
        {
            "dt": 1628708400,
            "sunrise": 1628683719,
            "sunset": 1628733703,
            "moonrise": 1628695140,
            "moonset": 1628741220,
            "moon_phase": 0.11,
            "temp": {
                "day": 93.22,
                "min": 73.22,
                "max": 96.94,
                "night": 87.17,
                "eve": 94.51,
                "morn": 73.22
            },
            "feels_like": {
                "day": 88.63,
                "night": 83.64,
                "eve": 89.82,
                "morn": 71.13
            },
            "pressure": 1011,
            "humidity": 9,
            "dew_point": 25.95,
            "wind_speed": 13.82,
            "wind_deg": 194,
            "wind_gust": 12.06,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 0,
            "pop": 0,
            "uvi": 9.46
        },
        {
            "dt": 1628794800,
            "sunrise": 1628770176,
            "sunset": 1628820027,
            "moonrise": 1628785620,
            "moonset": 1628829240,
            "moon_phase": 0.15,
            "temp": {
                "day": 87.98,
                "min": 74.7,
                "max": 91.04,
                "night": 82.06,
                "eve": 89.89,
                "morn": 74.7
            },
            "feels_like": {
                "day": 84.25,
                "night": 80.01,
                "eve": 85.84,
                "morn": 72.57
            },
            "pressure": 1016,
            "humidity": 15,
            "dew_point": 33.57,
            "wind_speed": 12.21,
            "wind_deg": 60,
            "wind_gust": 21.34,
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": 38,
            "pop": 0,
            "uvi": 10
        },
        {
            "dt": 1628881200,
            "sunrise": 1628856633,
            "sunset": 1628906350,
            "moonrise": 1628876220,
            "moonset": 1628917320,
            "moon_phase": 0.18,
            "temp": {
                "day": 85.26,
                "min": 70.74,
                "max": 92.07,
                "night": 78.85,
                "eve": 89.46,
                "morn": 70.74
            },
            "feels_like": {
                "day": 82.24,
                "night": 78.85,
                "eve": 85.75,
                "morn": 68.92
            },
            "pressure": 1021,
            "humidity": 20,
            "dew_point": 40.1,
            "wind_speed": 16.55,
            "wind_deg": 166,
            "wind_gust": 15.61,
            "weather": [
                {
                    "id": 800,
                    "main": "Clear",
                    "description": "clear sky",
                    "icon": "01d"
                }
            ],
            "clouds": 4,
            "pop": 0.08,
            "uvi": 10
        },
        {
            "dt": 1628967600,
            "sunrise": 1628943091,
            "sunset": 1628992672,
            "moonrise": 1628966880,
            "moonset": 1629005580,
            "moon_phase": 0.22,
            "temp": {
                "day": 90.81,
                "min": 71.92,
                "max": 96.76,
                "night": 79.47,
                "eve": 94.01,
                "morn": 71.92
            },
            "feels_like": {
                "day": 86.9,
                "night": 79.47,
                "eve": 89.56,
                "morn": 70.61
            },
            "pressure": 1016,
            "humidity": 18,
            "dew_point": 41.63,
            "wind_speed": 9.22,
            "wind_deg": 264,
            "wind_gust": 15.55,
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10d"
                }
            ],
            "clouds": 0,
            "pop": 0.52,
            "rain": 0.69,
            "uvi": 10
        }
    ]
}
end
