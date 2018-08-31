Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#index'

  get '/dashboard', to: 'users#show'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create', as: :users
  get '/activate', to: 'users#update'
  # resources :users, only: [:create]

  namespace :api do
    namespace :v1 do
      post "/games", to: "games#create"
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
        post "/ships", to: "games/ship_placement#create"
      end
    end
  end
end
