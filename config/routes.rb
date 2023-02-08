
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :golfers, only: [:index, :create, :destroy] do
        resources :golfer_trips, only: [:index, :show, :create]
      end
      post '/login',    to: 'sessions#create'
      post '/logout',   to: 'sessions#destroy'
      get '/login_status', to: 'sessions#login_status'
      resources :trips, only: [:index, :show, :create]
      get '/next_trip', to: 'trips#next_trip'
      resources :courses, only: [:index, :create]
    end
  end
end
