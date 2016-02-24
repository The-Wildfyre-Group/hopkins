class User < ActiveRecord::Base
  include Signup
  include Password
  
  before_save :encrypt_password
  
  def name
    (first_name.present? && last_name.present?) ? [first_name, last_name].join(" ") : email
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
  
end
