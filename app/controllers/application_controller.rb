class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find_by_authentication_token(cookies[:authentication_token]) if cookies[:authentication_token]
  end
  
  def education
    ["Less than High School", "High School/Some College", "Bachelor’s and Higher"]
  end
  
  helper_method :education, :current_user
end
