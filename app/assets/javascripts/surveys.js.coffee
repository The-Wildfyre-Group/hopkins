$ ->
  if $("#surveys").length
    setTimeout ->
      ["Status", "Services", "Behavior", "Psycho Social", "Closing"].forEach (module)->
        $.get "users/completed_survey?module=#{module}", (response)->
          class_name = module.toLowerCase().replace(" ", "-")
          unless response.completed
            $("#surveys .#{class_name}").removeClass "disabled"
    , 100