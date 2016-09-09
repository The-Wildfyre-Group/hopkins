class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by_authentication_token(cookies[:authentication_token]) if cookies[:authentication_token]
  end

  def authenticate_user!
    redirect_to login_path if current_user.nil?
  end

  def completed_all_surveys?
    redirect_to "/results" if current_user.completed_all_surveys?
  end

  def is_eligible?
    #redirect_to "/consent/status" unless current_user.eligible?
  end

  def education
    ["Less than High School", "High School/Some College", "Bachelor’s and Higher"]
  end

  def range
    [ [["18-34"],[18,34]], [["35-64"], [35,64]], [["65+"], [65]] ]
  end

  def regions
    ["Northeast", "South", "Midwest", "West"]
  end

  def races
    ["White", "Black or African American", "American Indian or Alaska Native", "Asian", "Native Hawaiian or Other Pacific Islander"]
  end

  def partners
    ["The White House My Brother’s Keeper Initiative", "100 Black Men", "National Urban League" , "NAACP" , "Rainbow PUSH Coalition" , "Concerned Black Men", "Ebony Magazine" , "The Root" , "BET" , "Radio One" , "TV One" , "National Medical Association", "Alpha Phi Alpha Fraternity Inc." , "Kappa Alphas Psi Fraternity Inc." , "Omega Psi Phi Fraternity Inc." , "Phi Beta Sigma Fraternity Inc." , "Iota Phi Theta Fraternity Inc." , "National Council of Negro Women" , "Alpha Kappa Alpha", "Delta Sigma Theta", "Zeta Phi Beta", "Sigma Gamma Rho"]
  end

  def years
    first = Date.today.year - 110
    last = Date.today.year - 1
    (first..last).to_a.reverse
  end

  def days_for_select
    first = 1
    last = 31
    (first..last).to_a
  end

  def months_for_select
    [["January", 1], ["February", 2], ["March", 3], ["April", 4], ["May", 5], ["June", 6], ["July", 7], ["August", 8], ["September", 9], ["October", 10], ["November", 11], ["December", 12]]
  end

  def months

  end

  def days

  end

  helper_method :education, :current_user, :years, :months_for_select, :days_for_select, :partners, :range, :regions, :races
end
