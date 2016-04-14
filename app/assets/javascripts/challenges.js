$(function(){
  $("#challenges").sortable({
    axis: "y",
    stop: function(event, ui) {
      var order = $(this).sortable('serialize', { key: "order[]" });
      // var token = $('meta[name=csrf-token]').attr('content');
      $.post("/challenges/set_order", order)
      // $.ajax({
      //   type: 'post',
      //   dataType:'text',
      //   data: order + "&authenticity_token=" + token,
      //   url:'/challenges/set_order'
      // })
    }
  });
});