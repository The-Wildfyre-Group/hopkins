$ ->
  if $("#surveys").length
    setTimeout ->
      $.get "users/completed_surveys", (response)->
        response.data.surveys.forEach (surveyData)->
          class_name = surveyData.name.toLowerCase().replace(" ", "-")
          $("#surveys .#{class_name}").removeClass "disabled" unless surveyData.completed
        $('.survey-remaining').html(response.data.left_surveys)
    , 100