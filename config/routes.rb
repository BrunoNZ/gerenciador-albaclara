require 'sidekiq/web'
Rails.application.routes.draw do
  root 'pages#index'

  resources :productivities
  resources :clients do
    resources :schedules
  end
  get 'schedules' => 'schedules#empty_index'
  # resources :users

  namespace 'report' do
    get 'schedules' => 'schedules#index'
    get 'schedules/:id' => 'schedules#show'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  # mount Sidekiq::Web => '/sidekiq'

end
