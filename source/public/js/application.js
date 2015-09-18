$(document).ready(function() {
  $('#new_comment').on('submit', function(event) {
    event.preventDefault();
    console.log("HELLO")
    var datum = $(this).serialize();
    $.ajax({
      method: "post",
      url: "/comments",
      data: datum
    })
    .done(function(request) {
      $('.comment_list ul').append("<li>" + request + "</li>");
    })
  })
});
