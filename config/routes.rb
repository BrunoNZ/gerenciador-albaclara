require 'sidekiq/web'
Rails.application.routes.draw do
  resources :productivities
  resources :schedules
  resources :clients
  root 'pages#index'
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  mount Sidekiq::Web => '/sidekiq'
end
