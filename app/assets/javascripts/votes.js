$(document).ready(function() {

  $('a#vote').on('ajax:success', function(e, response) {
    $(this).text($(this).data('text') + ' ' + response.new_count);
  });

  $('a#vote').on('ajax:error', function(e, xhr) {
    alert("You already voted!");
  });

});

//send ajax to server
// on AJAX success
// change vote count on the link
// IF position has changed based on order
        //  fade out div
        //
