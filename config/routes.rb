Rails.application.routes.draw do
  root to: 'welcome#index'
  get '/register', to: 'users#new'
  get '/activate', to: 'activate#index'
  get '/dashboard', to: 'users#show'
  get '/login', to: 'session#new'
  post '/login', to: 'session#create'
  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show, :new, :create] do
        post '/shots', to: 'games/shots#create'
        post '/ships', to: 'games/ships#create'
      end
    end
  end
end
