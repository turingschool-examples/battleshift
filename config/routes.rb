Rails.application.routes.draw do

  root 'welcome#index'

  get '/login',     to: 'sessions#new'
  post '/login',    to: 'sessions#create'
  get '/register',  to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'

  resources :users, only: [:create]
  # need to do the post '/register' to 'sessions#create'
  # need to have a delete 'logout' to 'sessions#destroy'

  namespace :users do
    get '/:id/activate', to: 'activation#update', as: :activation
  end

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post '/shots', to: 'games/shots#create'
      end
    end
  end
end
