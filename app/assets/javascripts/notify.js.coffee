window.notifySuccess=(message) ->
  $.notify {
      icon: 'glyphicon glyphicon glyphicon-ok'
      message: message
    },
    type: 'success'
    offset:
      x: 20
      y: 120
    placement:
      from: 'top'
      align: 'right'
    delay: 10000
    mouse_over: 'pause'

window.notifyError=(message) ->
  $.notify {
      icon: 'glyphicon glyphicon glyphicon-remove'
      message: message
    },
    type: 'danger'
    offset:
      x: 20
      y: 120
    placement:
      from: 'top'
      align: 'right'
    delay: 10000
    mouse_over: 'pause'

window.notifyNotice=(message) ->
  $.notify {
      icon: 'glyphicon glyphicon glyphicon-ok'
      message: message
    },
    type: 'info'
    offset:
      x: 20
      y: 120
    placement:
      from: 'top'
      align: 'right'
    delay: 10000
    mouse_over: 'pause'


$(document).ready ->
  if $('.success').length
    notifySuccess($('.success').data('message'))
  if $('.notice').length
    notifyNotice($('.notice').data('message'))
  if $('.errors').length
    notifyError($('.errors').data('message'))