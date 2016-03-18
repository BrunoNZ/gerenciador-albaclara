require 'sidekiq/web'
Rails.application.routes.draw do
  root 'pages#index'

  resources :productivities
  resources :schedules
  resources :clients
  resources :users

  namespace 'report' do
    get 'schedules' => 'report/schedules#index'
    get 'schedules/:id' => 'report/schedules#show'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  # mount Sidekiq::Web => '/sidekiq'

end
