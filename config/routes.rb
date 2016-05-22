require 'sidekiq/web'
Rails.application.routes.draw do

  devise_for :users
  resources :users

  resources :documents
  resources :supervisors
  resources :clients
  resources :schedules
  resources :productivities

  namespace 'report' do
    get 'schedules' => 'schedules#index'
    get 'schedules/:id' => 'schedules#show'
  end

  root 'pages#index'
  # mount Sidekiq::Web => '/sidekiq'

end
