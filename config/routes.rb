Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecasts#index'
      resources :users, only: :create
      resources :backgrounds, only: :index
      resources :breweries, only: :index
      resources :sessions, only: :create
      post '/road_trip', to: 'roadtrips#create'
    end
  end
end
