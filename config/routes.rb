Rails.application.routes.draw do
  root 'welcome#index'

  get "/register", to: "user#new"
  post "/register", to: "user#create"
  get "/dashboard", to: "user#show"

  get "/activate", to: "activation#new"
  get "/activate-success", as: "activate_success", to: "activation#show"

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
