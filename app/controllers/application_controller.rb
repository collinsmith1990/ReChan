class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to root_url
    end
  end

  def matching_user_id(user_id)
    unless logged_in?
      if user_id
        flash[:danger] = "Please log in"
        redirect_to root_url
      end
    else 
      if current_user.id != user_id.to_i
        flash[:danger] = "Please log in"
        redirect_to root_url
      end
    end
  end
end
