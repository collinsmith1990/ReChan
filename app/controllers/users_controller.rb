class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.user_name}!"
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments
  end

  private

    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation)
    end
end
