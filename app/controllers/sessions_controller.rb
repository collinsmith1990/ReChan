class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name].downcase)
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Logged in"
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid username/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
