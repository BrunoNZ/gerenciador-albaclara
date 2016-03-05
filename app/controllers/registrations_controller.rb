# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_admin!
end
