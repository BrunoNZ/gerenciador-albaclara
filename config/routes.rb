require 'sidekiq/web'
Rails.application.routes.draw do
  root 'pages#index'

  resources :clients do
    resources :schedules
    resources :productivities
  end
  get 'schedules' => 'schedules#index_all'
  get 'productivities' => 'productivities#index_all'
  # resources :users

  namespace 'report' do
    get 'schedules' => 'schedules#index'
    get 'schedules/:id' => 'schedules#show'
  end

  devise_for :users, :controllers => {:registrations => "registrations"}

  # mount Sidekiq::Web => '/sidekiq'

end
