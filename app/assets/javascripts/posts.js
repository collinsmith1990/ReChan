$(document).ready(function() {
  $("#comment-form").addClass("hidden");
  $("#comment-button").click(function() {
    $("#comment-form").toggleClass("hidden");
  });
});
