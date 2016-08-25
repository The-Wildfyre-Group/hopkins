module SurveysHelper
  
  def next_survey_if_previous_completed(user, previous_survey)
    if user.completed_survey?(previous_survey)
      return services_surveys_path if previous_survey == "Status"
      return behavior_surveys_path if previous_survey == "Services"
      return psychosocial_surveys_path if previous_survey == "Behavior"
      return closing_surveys_path if previous_survey == "Psycho Social"
    else
      "javascript: void(0)"
    end
    
  end
  
  
end
