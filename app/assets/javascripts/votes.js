$(document).ready(function() {
  $('a#vote').on('ajax:success', function() {
    var votes = parseInt($(this).attr('votes'));
    var new_count = votes + 1
    $(this).attr('votes', new_count);
    $(this).text(a.attr('text') + ' ' + new_count);
  });

});
