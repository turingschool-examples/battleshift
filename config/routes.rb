Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  get '/register', to: 'users#new', as: 'registration'
  get '/dashboard', to: 'users#show'
  get '/activate/:key', to: 'activation#show'
  post '/api/v1/games/:game_id/ships', to: 'api/v1/ships#create'
  post '/api/v1/games', to: 'api/v1/games#create'


  resources :users, only: [:create]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:create, :show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
