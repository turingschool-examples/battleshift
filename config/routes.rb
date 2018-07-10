Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :create] do
        post "/shots", to: "games/shots#create"
        post "/ships", to: "games/ships#create"
      end
    end
  end

  resources :users, only: :create

  root to: 'home#index'
  get '/register', to: 'users#new'
  get '/dashboard', to: 'users#show'
  get '/activate', to: 'activation#show'
end
