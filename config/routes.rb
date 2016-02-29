require 'sidekiq/web'
Rails.application.routes.draw do
  resources :schedules
  resources :clients
  root 'pages#index'
  devise_for :users
  resources :users
  mount Sidekiq::Web => '/sidekiq'
end
