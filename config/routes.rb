Rails.application.routes.draw do
  root 'welcome#index'

  get "/register", to: "user#new"
  post "/register", to: "user#create"
  get "/dashboard", to: "user#show"
  
  get "/activate", as: "activate", to: "activation#new"

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
