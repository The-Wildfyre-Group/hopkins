$(function() {
  $("#challenges").sortable({
    axis: "y",
    stop: function(event, ui) {
      var order = $(this).sortable('serialize', { key: "order[]" });
      $.post("/challenges/set_order", order);
    }
  });
});