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
  
  def years
    first = Date.today.year - 110
    last = Date.today.year - 18
    (first..last).to_a.reverse
  end
  
  def days_for_select
    first = 1
    last = 31
    (first..last).to_a
  end
  
  def months_for_select
    first = 1
    last = 12
    (first..last).to_a
  end
  
  def months
    
  end
  
  def days
    
  end
  
  
  
  helper_method :education, :current_user, :years, :months_for_select, :days_for_select
end
