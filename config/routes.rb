# == Route Map
#

Rails.application.routes.draw do
  root "homepage#show"
  post "sessions/create"
  get "login", to: "sessions#new", as: "login"
  delete "logout", to: "sessions#destroy", as: "logout"
  resources :users
  resources :folders
  resources :posts
end
