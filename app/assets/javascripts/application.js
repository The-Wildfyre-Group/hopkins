// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-tagsinput
//= require jquery-ui
//= require jquery.remotipart
//= require backend/layerslider/js/layerslider.kreaturamedia.jquery
//= require validator
//= require challenges
//= require surveys
//= require share
//= require backend/backend
//= require bootstrap-notify
//= require notify


$(document).ready(function() {
// commentented because of error layerSlider is not a function
//  $('#layerslider').layerSlider({
//    autoStart: true,
//    responsive: true,
//    responsiveUnder: 1280,
//    layersContainer: 1170,
//    skinsPath: 'layerslider/skins/'
//  });

  var csrf_token = $('meta[name="csrf-token"]').attr('content');
  $.ajaxPrefilter(function(options, originalOptions, jqXHR) {
    if (options.type.toLowerCase() === "post") {
      options.data = options.data || "";
      options.data += options.data ? "&" : "";
      options.data += "authenticity_token=" + encodeURIComponent(csrf_token);
    }
  });
});
