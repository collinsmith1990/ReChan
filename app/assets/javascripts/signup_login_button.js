$(document).ready(function() {
  $("#signup-button").click(function() {
    $("#signup-tab").addClass("active");
    $("#signup-pane").addClass("active");
    $("#login-tab").removeClass("active");
    $("#login-pane").removeClass("active");
  });

  $("#login-button").click(function() {
    $("#login-tab").addClass("active");
    $("#login-pane").addClass("active");
    $("#signup-tab").removeClass("active");
    $("#signup-pane").removeClass("active");
  });
});
