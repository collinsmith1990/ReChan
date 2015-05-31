$(function() {

  $("#newuserform").validate( {
    rules: {
      "user[user_name]": user_name_rules,
      "user[password]": password_rules,
      "user[password_confirmation]": password_confirmation_rules
    },
    messages: {
      "user[user_name]": user_name_message,
      "user[password]": password_message,
      "user[password_confirmation]": password_confirmation_message,
    },
    highlight: function(element) {
      $(element).closest('.form-group').addClass('has-error has-feedback');
      $(element).siblings('i').removeClass(success_icon);
      $(element).siblings('i').addClass(error_icon);
    },
    unhighlight: function(element) {
      $(element).closest('.form-group').removeClass('has-error');
      $(element).closest('.form-group').addClass('has-success has-feedback');
      $(element).siblings('i').removeClass(error_icon);
      $(element).siblings('i').addClass(success_icon);
    }
  });
});
