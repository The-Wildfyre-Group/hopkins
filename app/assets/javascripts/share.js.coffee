$(document).ready ->
  if $('.share-form').length
    $('.share-form input').change ->
      if $('#share-photo-file').val() isnt '' and $('#share_name').val() isnt ''
        $('#share-form-submitter').click()

