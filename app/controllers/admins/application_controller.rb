class Admins::ApplicationController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

end
