function highlight(element) {
  $(element).closest('.form-group').addClass('has-error has-feedback');
  $(element).siblings('i').removeClass(success_icon);
  $(element).siblings('i').addClass(error_icon);
};

function unhighlight(element) {
  $(element).closest('.form-group').removeClass('has-error');
  $(element).closest('.form-group').addClass('has-success has-feedback');
  $(element).siblings('i').removeClass(error_icon);
  $(element).siblings('i').addClass(success_icon);
};

$(function() {

  //-----New User Form-----
  $("#newuserform").validate( {
    rules: {
      "user[user_name]": user_name_rules,
      "user[password]": password_rules,
      "user[password_confirmation]": password_confirmation_rules
    },
    messages: {
      "user[user_name]": user_name_message,
      "user[password]": password_message,
      "user[password_confirmation]": password_confirmation_message
    },
    highlight: function(element) {
      highlight(element);
    },
    unhighlight: function(element) {
      unhighlight(element);
    }
  });

  //-----User Sign In Form-----
  $("#usersigninform").validate( {
    rules: {
      "session[user_name]": { required: true },
      "session[password]": { required: true }
    },
    messages: {
      "session[user_name]": user_name_message,
      "session[password]": password_message
    },
    highlight: function(element) {
      highlight(element);
    },
    unhighlight: function(element) {
      unhighlight(element);
    }
  });

  //-----Comment Form-----
  $("#commentform").validate( {
    rules: {
      "comment[content]": { required: true }
    },
    messages: {
      "comment[content]": comment_message
    },
    highlight: function(element) {
      highlight(element);
    },
    unhighlight: function(element) {
      unhighlight(element);
    }
  });

  //-----Post Form-----
  $("#postform").validate( {
    rules: {
      "post[title]": post_title_rules
    },
    messages: {
      "post[title]": title_post_message
    },
    highlight: function(element) {
      highlight(element);
    },
    unhighlight: function(element) {
      unhighlight(element);
    }
  });

  //-----Post Form-----
  $("#linkpostform").validate( {
    rules: {
      "post[title]": post_title_rules,
      "post[link]": post_link_rules
    },
    messages: {
      "post[title]": title_post_message,
      "post[link]": title_link_message
    },
    highlight: function(element) {
      highlight(element);
    },
    unhighlight: function(element) {
      unhighlight(element);
    }
  });
});
