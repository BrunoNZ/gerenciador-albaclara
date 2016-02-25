Rails.application.routes.draw do
  resources :schedules
  resources :clients
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
