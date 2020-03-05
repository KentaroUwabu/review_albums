Rails.application.routes.draw do
  devise_for :users
  root 'albums#index'
  resources :artists
  resources :albums
  resources :users, only: [:show]
  resources :reviews
end
