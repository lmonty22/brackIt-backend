Rails.application.routes.draw do
  # resources :teams
  # resources :match_ups
  # resources :rounds
  resources :tournaments, only: [:create, :show, :index, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
