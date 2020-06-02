Rails.application.routes.draw do
  resources :teams
  resources :match_ups
  resources :rounds
  resources :tournaments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
