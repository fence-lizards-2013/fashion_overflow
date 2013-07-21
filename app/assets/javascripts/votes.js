$(document).ready(function() {

  $('a#vote').on('ajax:success', function(e, response) {
    $(this).text($(this).data('text') + ' ' + response.new_count);
    var $outerClass = $(this).parents().eq(2);
    var $current = $(this).parents().eq(2).data().aggregate;

    if ($(this).data().text === "upvotes") { 
      $outerClass.attr('data-aggregate', $current+1) 
    };
    if ($(this).data().text === "downvotes") { 
      $outerClass.attr('data-aggregate', $current-1) 
    };
    //todo: fix sorting
    $('.photo_block').tsort('.whole_photo',{attr:'data-aggregate', order:'desc'});
    debugger
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
