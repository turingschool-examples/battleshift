Rails.application.routes.draw do
  root 'homepage#show'

  # Users resources
  resources :users, only: [:create, :update, :destroy, :index, :edit]
  get '/register', to: 'users#new'
  get '/dashboard/:id', to: 'users#show', as: :dashboard

  # Session resources
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  # Activation resources
  post '/activate/user', to: 'activation#show'

  # API resources
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end

  # Notification resources
  post '/welcome', to: 'notification#create'
end
