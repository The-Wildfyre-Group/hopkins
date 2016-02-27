class User < ActiveRecord::Base
  include Census
  include Signup
  include Password
  
  before_save :encrypt_password
  before_save :set_region

  
  def name
    (first_name.present? && last_name.present?) ? [first_name, last_name].join(" ") : email
  end
  
  def set_region
    self.region = Location.region(state)
  end
  
  def completed_survey(string)
    survey = Survey.data(string)
    completed_response = survey["responses"].select { |k,v| k["completed"] == "1" && k["hidden"]["id"] == id.to_s }
  end
  
  def completed_survey?(string)
    completed_response = completed_survey(string)
    completed_response.present?
  end
  
  def surveys_completed
    array = []
    Survey::SURVEY_MODULES.each do |survey|
      array << completed_survey?(survey)
    end
    array.count(true)
  end
  
  def signup_age
    now = created_at.in_time_zone("Eastern Time (US & Canada)")
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end
  
  def age
    now = Time.now.in_time_zone("Eastern Time (US & Canada)")
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end       
  
end
