<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://github.com/othneildrew/Best-README-Template">
    <img src="https://user-images.githubusercontent.com/72179421/127915894-7ac33fe7-7205-455a-a273-3543535f75a0.png" alt="Logo" width="195" height="195">
  </a>

  <h3 align="center">sweaterWEATHER | API</h3>

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about">About</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
  </ol>
</details>



<!-- ABOUT-->
## About
Backend for application allowing users to map out trips using provided data such as estimated travel time, current weather and - if you've travelled, you'll know this is the <em>best part</em> - WHAT TO PACK for your arrival (as forecast upon arrival to a destination is also given). App functionality includes user registration, login, and background images.


### Built With

* [Ruby | v](https://www.ruby-lang.org/en/)
* [Rails | v](https://rubyonrails.org/)

<!-- GETTING STARTED -->
## Getting Started

Get your weather of sweaters or otherwise, by visiting [LocalHost:3000](http://localhost:3000/) - starting with the steps below.

### Prerequisites

- You can familiarize yourself with the APIs consumed for build:
- <strong>[Mapquest Geocoding]</strong>(https://developer.mapquest.com/documentation/geocoding-api/)
- <strong>[OpenWeather]</strong>(https://openweathermap.org/api/one-call-api)
- <strong>[Mapquest Directions]</strong>(https://developer.mapquest.com/documentation/directions-api/route/get/)
- <strong>[Unsplash]</strong>(https://unsplash.com/developers)

<!-- INSTALLATION -->
## Installation

1. Fork and clone this repo
2. Add Figaro to Gemfile
   ```sh
   #sweater_weather/gemfile
   
   #group :development, :test do
   gem 'figaro'
   #end
   ```
3. Add your API Key
   ```sh
   #config/application.yml
   
   API_KEY = 'ENTER YOUR API'
   ``` 
3. Install gem packages by running `bundle`
4. Setup the database by running `rails db:{drop,create,migrate}`
5. Run `rails s` and navigate to http://localhost:3000

#### Additional gems used can be installed following above instructions:</strong>
- [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer)
- [bcrypt ~> 3.1.7](https://github.com/bcrypt-ruby/bcrypt-ruby)
- [capybara](https://github.com/teamcapybara/capybara)
- [webmock](https://github.com/webmock/webmock)
- [vcr](https://github.com/vcr/vcr)

<!-- USAGE -->
## Usage

Below are all included endpoints, along with necessary params.
* All will append to base connector [http://localhost:3000](http://localhost:3000)

### Forecast:

| Method   | URL                      | Detail             | Params                                             |
| -------- | ------------------------ | ------------------ | -------------------------------------------------- |
| `GET`    | `/api/v1/forecast`     | Forecast for Given Location     | { location: 'city,state' } |


### Images:

| Method   | URL                      | Detail             | Params                                             |
| -------- | ------------------------ | ------------------ | -------------------------------------------------- |
| `GET`    | `/api/v1/backgrounds`     | Image for Given Location     | { location: 'city,state' } |

### Users:

| Method   | URL                      | Detail             | Params                                             |
| -------- | ------------------------ | ------------------ | -------------------------------------------------- |
| `POST`    | `/api/v1/users`     | Create New User     | { "email": "email@emails.com", "password": "thisismypassword", "password_confirmation": "thisismypassword" } |
| `POST`   | /api/v1/sessions         | User Login         | { "email": "email@emails.com", "password": "password" } | 

### Road Trip:

| Method   | URL                      | Detail             | Params                                             |
| -------- | ------------------------ | ------------------ | -------------------------------------------------- |
| `POST`    | `/api/v1/road_trip`     | Road Trip for Given Origin and Destination | { "origin": "Denver,CO", "destination": "Billings,MT", "api_key": "24charactershere" } |

<!-- EXAMPLES -->
## EXAMPLES

### Forecast
* GET http://localhost:3000/api/v1/forecast | params: { location: 'denver,co' }

```

{
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
}
    
```


### Road Trip
* GET http://localhost:3000/api/v1/forecast | params: { "origin": 'Denver,Co', "destination": "Pueblo,CO", "api_key": "jgn983hy48thw9begh98h4539h4" }

```
{
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
    
```


<!-- ROADMAP -->
## Roadmap

Proposed features (and known issues).<br>
- Routes with no option for driving provide flight time (WIP)
