$(document).ready ->
  if $('.share-form').length
    $('#photo-upload-btn').click ->
      $('#share-photo-file').trigger('click')
      false

    $('.share-form input').change ->
      if $('#share-photo-file').val() isnt '' and $('#share_name').val() isnt ''
        $('#share-form-submitter').click()
        $('#share_name').val('')

