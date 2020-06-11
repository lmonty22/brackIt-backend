Rails.application.routes.draw do
  post '/login', to: 'auth#create'
  get '/relogin', to: 'auth#relogin'
  # resources :teams
  resources :match_ups, only: [:update]
  # resources :rounds
  resources :tournaments, only: [:create, :show, :index, :destroy]
  resources :users, only: [:index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
