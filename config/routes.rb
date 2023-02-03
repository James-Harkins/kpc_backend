
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :golfers, only: [:index, :create, :destroy] do
        resources :golfer_trips, only: [:index, :show, :create]
      end
      post '/login',    to: 'sessions#create'
      post '/logout',   to: 'sessions#destroy'
      resources :trips, only: [:index, :show, :create]
      resources :courses, only: [:index, :create]
    end
  end
end
