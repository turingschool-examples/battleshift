Rails.application.routes.draw do
  root to: "welcome#index"
  get "/register", to: 'users#new'

  resources :users, except: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get :confirm_email
    end
  end

  get '/dashboard', to: 'users#show'
  resources :users, only: [:new, :create]

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
