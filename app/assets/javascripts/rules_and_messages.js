var user_name_rules = { required: true, rangelength: [1, 35], checkUserName: true };
var password_rules = { required: true, minlength: 6 };
var password_confirmation_rules = { required: true, minlength: 6, equalTo: "#password" };

var user_name_message = { required: "Please enter a username.",
                          rangelength: "User name must be less than 35 characters." }
var password_message = { required: "Please enter a password.", 
                         minlength: "Please enter a valid password of at least 6 characters." }
var password_confirmation_message = { required: "Please confirm your password.",
                                      equalTo: "Passwords don't match." }

var success_icon = "glyphicon glyphicon-ok form-control-feedback"
var error_icon = "glyphicon glyphicon-remove form-control-feedback"

$.validator.addMethod("checkUserName", 
  function(value, element) {
    var result = false;
    var request = $.ajax({
      type:"POST",
      async: false,
      url: "/check_username",
      data: {username: value},
      success: function(data) {
        console.log(data);
        result = (data.exist == false) ? true : false;
      }
    });
    return result; 
  }, 
  "This username is already taken."
);
