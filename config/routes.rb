Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  resources :users do
    member do
      get :confirm_email
    end
  end

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'
  get '/dashboard', to: 'dashboard#show'
  get '/confirmation', to: 'confirmation#show'


  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
