Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show] do
        get '/confirmation', to: "confirmation#update"
        get '/confirmed', to: "confirmation#show"
      end
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end

  resources :users, only: [:new, :index, :create]

  root to: "welcome#show"
  get "/register", to: "users#new"
  get "/dashboard", to: "dashboard#show"
end
