Rails.application.routes.draw do
  post '/login', to: 'auth#create'
  # resources :teams
  resources :match_ups, only: [:update]
  # resources :rounds
  resources :tournaments, only: [:create, :show, :index, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
