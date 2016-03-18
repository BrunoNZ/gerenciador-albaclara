require 'sidekiq/web'
Rails.application.routes.draw do
  root 'pages#index'

  resources :productivities
  resources :schedules
  resources :clients
  resources :users

  namespace 'report' do
    get 'schedules' => 'schedules#index'
    get 'schedules/:id' => 'schedules#show'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  # mount Sidekiq::Web => '/sidekiq'

end
