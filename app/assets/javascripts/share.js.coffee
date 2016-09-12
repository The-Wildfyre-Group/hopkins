$(document).ready ->

  SetCoordinates = (c) ->
    $('#imgX1').val c.x
    $('#imgY1').val c.y
    $('#imgWidth').val c.w
    $('#imgHeight').val c.h
    $('#btnCrop').show()

  $(document).on 'change', '#share-photo-file', ->
    $('#cropModal').modal('show')
    $( ".modal-body" ).empty()
    $( ".modal-body" ).append("<img id='Image1' src='' alt='' style='display: none' />")
    $('#Image1').hide()
    reader = new FileReader

    reader.onload = (e) ->
      $('#Image1').show()
      $('#Image1').attr 'src', e.target.result
      $('#Image1').Jcrop
        boxWidth: 100
        boxHeight: 100
        aspectRatio: 1
        onChange: SetCoordinates
        onSelect: SetCoordinates

    reader.readAsDataURL $(this)[0].files[0]

  $('#btnCrop').click ->
    $('#btnOk').show()
    $('#btnCrop').hide()
    x1 = $('#imgX1').val()
    y1 = $('#imgY1').val()
    width = $('#imgWidth').val()
    height = $('#imgHeight').val()
#    canvas = $('#canvas')[0]
    canvas = $('#canvas')
    context = canvas.getContext('2d')
    debugger
    img = new Image()
    debugger
    img.onload = ->
      debugger
      canvas.height = height
      canvas.width = width
      context.drawImage img, x1, y1, width, height, 0, 0, width, height
      $('#imgCropped').val canvas.toDataURL()

    img.src = $('#Image1').attr('src')
    debugger
#    $('#btnOk').show()
#    $('#btnCrop').hide()


  $('#btnOk').click ->
    if $('#share-photo-file').val() isnt '' and $('#share_name').val() isnt ''
      $('#share-form-submitter').click()
    else
      $('#cropModal').modal('hide')

  if $('.share-form').length
    $('.share-form input').change ->
      if $('#share-photo-file').val() isnt '' and $('#share_name').val() isnt ''
        $('#share-form-submitter').click()

