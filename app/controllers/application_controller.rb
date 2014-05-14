class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :null_session

  
  before_filter :authenticate_user!, :set_global_search_variable, :configure_permitted_parameters, if: :devise_controller?
  #before_filter :send_threshold_email

def after_sign_out_path_for(resource)
  return "/users/sign_in"
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password) }
  end

  def set_global_search_variable
    @search = Patient.search(params[:q])
    @patients = @search.result
  end




end
