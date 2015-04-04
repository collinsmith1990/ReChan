module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def forget(user)
    cookies.delete(:user_id)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find_by(id: user_id)
  end
end
