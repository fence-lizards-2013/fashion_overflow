$(document).ready(function() {

  $('a#vote').on('ajax:success', function(e, response) {
    $(this).text($(this).data('text') + ' ' + response.new_count);
    // once they've voted, disable the links and just display the vote counts!
  });

  $('a#vote').on('ajax:error', function(e, xhr) {
    alert("You already voted!");
  });

});

