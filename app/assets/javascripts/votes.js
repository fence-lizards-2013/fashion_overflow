$(document).ready(function() {

  $('a#vote').on('ajax:success', function(e, response) {
    $(this).text($(this).data('text') + ' ' + response.new_count);
    var ul = $(this).parents().eq(1);
    var current = $(this).parents().eq(1).data().aggregate;
    if ($(this).data().up) { 
      ul.attr('data-aggregate', current+1) 
    };
    if (!$(this).data().up) { 
      ul.attr('data-aggregate', current-1) 
    };
    $('.crush_post').tsort('ul',{attr:'data-aggregate', order:'desc'});
  });


  $('a#vote').on('ajax:error', function(e, xhr) {
    alert("You already voted, DUMBASS !");
  });
});

//send ajax to server
// on AJAX success
// change vote count on the link
      // change data-aggregate
// IF position has changed based on order
        //  fade out div
            // figure out new order
        //  slide down/up other ones to clear a new space
        //  fade in the div
// END
