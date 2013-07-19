$(document).ready(function() {

  $('a#vote').on('ajax:success', function(e, response) {
    $(this).text($(this).data('text') + ' ' + response.new_count);
  });

  $('a#vote').on('ajax:error', function(e, xhr) {
    alert("You already voted!");
  });

});

