Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :games, only: [:show] do
        post "/shots", to: "games/shots#create"
      end
    end
  end
  get '/', to: 'welcome#index'
  resources :users, only: [:create]
  get '/register', to: 'users#new'
  get '/dashboard', to: 'dashboard#index'
  get '/confirmation', to: 'confirmation#create'
  post '/confirmation', to: 'confirmation#update'
end
