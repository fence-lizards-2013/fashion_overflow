// var PhotoList = {
//   sort: function() {
//     var $photosContainer = $('.photo_block');
//     var $photos = $photosContainer.children().clone();
//     var $sortedPhotos = $photos.tsort({data:'aggregate', order:'desc'});
//     $photosContainer.children().remove();
//     $photosContainer.append($sortedPhotos.each(function(index,photo){
//       $photo = $(photo)
//       $photo.fadeIn('fast');
//     }));    
//   }
// }

// var Photo = {
//   updateCounts: function($voteLink, voteCount) {
//     $voteLink.text($voteLink.data('text') + ' ' + voteCount.new_count);
//     var $wholePhoto = $voteLink.parents().eq(2);
//     var $current = $voteLink.parents().eq(2).data().aggregate;

//     // we are using .attr('data-aggregate') rather than .data('aggregate') because
//     // jQuery doesn't persist data attributes across scopes, and we use the aggregate
//     // data attribute in the PhotoList above, too
//     if($voteLink.data('text') === "upvotes"){
//       $wholePhoto.attr('data-aggregate', $current+1);
//     }else if($voteLink.data('text') === "downvotes"){ 
//       $wholePhoto.attr('data-aggregate', $current-1);
//     }else {
//       alert("An error occurred");
//     }
//   }
// }

function PhotoList(photosContainerSelector) {
  this.$photosContainer = $(photosContainerSelector);
  this.photos = {};
  this.setPhotosFromChildren();
}

PhotoList.prototype = {
  setPhotosFromChildren: function() {
    // loop through all of my children, instantiate a photo object
    var self = this;
    this.$photosContainer.children().each(function(i, photo) {
      var $wholePhoto = $(photo);
      self.photos[$wholePhoto.data('id')] = new Photo(
        $wholePhoto.data('id'),
        $wholePhoto.data('up-votes'),
        $wholePhoto.data('down-votes'),
        $wholePhoto.data('aggregate')
      );
    });
  },

  updatePhoto: function(crush) {
    var photo = this.photos[crush.id];
    photo.aggregate = crush.aggregate;
    photo.upVotes = crush.upVotes;
    photo.downVotes = crush.downVotes;
  }

  sortedPhotos: function() {
    // loop through this.photos, sorting based on our .aggregate attributes
    // and return an array sorted in that order
    var sortedPhotos = undefined; // FAIL
    return sortedPhotos;
  },

  render: function() {
    // clear out the photos container
    // append each new whole photo
  }
}

function Photo(id, upVotes, downVotes, aggregate) {
  this.id = id;
  this.upVotes = upVotes;
  this.downVotes = downVotes;
  this.aggregate = aggregate;
}

$(document).ready(function() {
  // 1. create a PhotoList
  var photoList = new PhotoList('.photo_block');

  $('.photo_block').on('ajax:success', 'a.vote', function(e, crush) {
    console.log(crush);
    photoList.updatePhoto(crush);
    photoList.render(photoList.sortedPhotos());
  });

  $('.photo_block').on('ajax:error', 'a.vote',function(e, xhr) {
    console.log('got here!');
    alert("You already voted, DUMBASS !");
  });
});
