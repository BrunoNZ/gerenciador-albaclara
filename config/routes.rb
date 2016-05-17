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

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  # mount Sidekiq::Web => '/sidekiq'

end
