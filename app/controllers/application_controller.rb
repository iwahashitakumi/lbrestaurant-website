class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(resource)
    admins_root_path
  end
  
  def after_sign_out_path_for(resource)
    new_admin_session_path
  end
end
