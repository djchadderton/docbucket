# == Route Map
#

Rails.application.routes.draw do
  root "folders#index"
  post "sessions/create"
  get "sessions/create", as: "admin_login_temp" # temp
  get "login", to: "sessions#new", as: "login"
  delete "logout", to: "sessions#destroy", as: "logout"
  resources :users
  resources :folders
  resources :posts
end
