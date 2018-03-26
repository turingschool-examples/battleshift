Rails.application.routes.draw do
  root to: "home#index"

  get "/dashboard", to: "users#show"
  get "/register", to: "users#new"
  resources :users, only: [:create]
  resources :activate, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
