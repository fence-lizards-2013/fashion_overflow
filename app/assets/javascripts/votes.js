$(document).ready(function() {
  function animateVoteChange(){
    var $clone = $('.photo_block').children().clone();
    var $sortedClone = $clone.tsort({attr:'data-aggregate', order:'desc'});
    var $container = $('.photo_block');
    $container.children().remove();
    $container.append($sortedClone.each(function(index,photo){
      $photo = $(photo)
      $photo.fadeIn('fast');
    }));
  }

  function changeAggregate(target, response){
    var $link = $(target);
    $link.text($link.data('text') + ' ' + response.new_count);
    var $wholePhoto = $link.parents().eq(2);
    var $current = $link.parents().eq(2).data().aggregate;

    if($link.data().text === "upvotes"){ 
      $wholePhoto.attr('data-aggregate', $current+1);
    }else if($link.data().text === "downvotes"){ 
      $wholePhoto.attr('data-aggregate', $current-1);
    }else {
      alert("An error occurred");
    }
  }

  $('.photo_block').on('ajax:success', 'a#vote',function(e, response) {
    console.log(response);
    changeAggregate($(this), response);
    animateVoteChange();
  });

  $('.photo_block').on('ajax:error', 'a#vote',function(e, xhr) {
    console.log('got here!');
    alert("You already voted, DUMBASS !");
  });
});
