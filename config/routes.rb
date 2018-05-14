Rails.application.routes.draw do
  get 'git/status'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'users#show'

  namespace :users do
    get '/:id/activate', to: 'activation#edit', as: :activation
    patch '/:id/activate', to: 'activation#update', as: :activate
  end

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post '/shots', to: 'games/shots#create'
      end
    end
  end
end
