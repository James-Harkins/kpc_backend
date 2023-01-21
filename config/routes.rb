Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :golfers, only: [:create] do
        resources :golfer_trips, only: [:index, :show, :create]
      end
      resources :sessions, only: [:create]
      resources :trips, only: [:index, :show, :create]
      resources :courses, only: [:index, :create]
    end
  end
end
