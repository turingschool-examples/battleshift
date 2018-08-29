Rails.application.routes.draw do
  root to: "welcome#index"
  get "/register", to: 'users#new'

  resources :users, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
