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
    
    var $clone = $('.photo_block').children().clone();
    var $sortedClone = $clone.clone().tsort({attr:'data-aggregate', order:'desc'});
    var $container = $('.photo_block');
    $container.children().remove();
    $container.append($sortedClone.each(function(index,photo){
      $photo = $(photo)
      $photo.fadeIn('fast');
    }));

    // debugger
    // $('.photo_block').children().tsort({attr:'data-aggregate', order:'desc'});
  });


  $('a#vote').on('ajax:error', function(e, xhr) {
    alert("You already voted, DUMBASS !");
  });
});
