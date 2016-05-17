require 'sidekiq/web'
Rails.application.routes.draw do
  root 'schedules#index'

  resources :clients
  resources :schedules
  resources :productivities

  namespace 'report' do
    get 'schedules' => 'schedules#index'
    get 'schedules/:id' => 'schedules#show'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  # mount Sidekiq::Web => '/sidekiq'

end
