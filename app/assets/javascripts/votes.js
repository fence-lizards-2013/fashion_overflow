function PhotoList(photosContainerSelector) {
  this.$photosContainer = $(photosContainerSelector);
  this.photoDivs = {};
  this.photos = {};
  this.toBeSortedPhotos = [];
  this.initializePhotosFromChildren();
}

PhotoList.prototype = {
  initializePhotosFromChildren: function() {
    // loop through all of my children, instantiate a photo object
    var self = this;
    this.$photosContainer.children().each(function(i, photo) {
      var $wholePhoto = $(photo);
      self.photoDivs[$wholePhoto.data('id')] = $wholePhoto;
      var photo = new Photo(
        $wholePhoto.data('id'),
        $wholePhoto.data('up-votes'),
        $wholePhoto.data('down-votes'),
        $wholePhoto.data('aggregate')
      );
      self.photos[$wholePhoto.data('id')] = photo;
      self.toBeSortedPhotos.push(photo);
    });
  },

  updatePhoto: function(crush) {
    var photo = this.photos[crush.id];
    photo.aggregate = crush.aggregate;
    photo.upVotes = crush.up_votes;
    photo.downVotes = crush.down_votes;

    var $photoDiv = this.photoDivs[crush.id];
    $photoDiv.find('.vote_link a').each(function(i, el) {
      debugger
      if ($(el).data('text') === 'upvotes') {
        $(el).text("upvotes " + photo.upVotes);
      } else {
        $(el).text("downvotes " + photo.downVotes);
      }
    });
  },

  render: function() {
    var sortedPhotos = this.toBeSortedPhotos.sort(function(photo1, photo2) {
      // descending sort based on aggregate
      return photo2.aggregate - photo1.aggregate;
    });
    this.toBeSortedPhotos = sortedPhotos;
    this.$photosContainer.html('');
    for (var i in sortedPhotos) {
      var photo = sortedPhotos[i];
      this.$photosContainer.append(this.photoDivs[photo.id]);
    }
  }
}

function Photo(id, upVotes, downVotes, aggregate) {
  this.id = id;
  this.upVotes = upVotes;
  this.downVotes = downVotes;
  this.aggregate = aggregate;
}

$(document).ready(function() {
  var photoList = new PhotoList('.photo_block');

  $('.photo_block').on('ajax:success', 'a.vote', function(e, crush) {
    photoList.updatePhoto(crush);
    photoList.render();
  });

  $('.photo_block').on('ajax:error', 'a.vote',function(e, xhr) {
    alert("You already voted, DUMBASS!");
  });
});
