class ApplicationController < ActionController::Base
  before_action :configure_sign_up_parameters, if: :devise_controller?

  protected

  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password current_password])
  end

  private

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
