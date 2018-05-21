Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :index, :create] do
        post "/shots", to: "games/shots#create"
        post "/ships", to: 'games/ships#create'
      end
    end
  end
  root 'welcome#index'

  get '/register', to: 'users#new'
  get '/activate', to: 'users#update'

  get '/dashboard', to: 'dashboard#show'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:create]
end
