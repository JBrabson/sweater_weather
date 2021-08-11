Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/forecast', to: 'forecast#index'
      post '/users', to: 'users#create'
      get '/backgrounds', to: 'backgrounds#index'
      get '/breweries', to: 'breweries#index'
      post '/sessions', to: 'sessions#create'
      post '/roadtrip', to: 'roadtrips#create'
    end
  end
end
