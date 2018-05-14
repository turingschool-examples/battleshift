Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get "/register", to: "users#new"
  post '/users', to: "users#create"
  get '/dashboard', to: "users#show"
  get '/activate', to: 'users#update'

  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
end
