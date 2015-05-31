class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.display_name}!"
      log_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.paginate(page: params[:comments_page])
    @posts = @user.posts.paginate(page: params[:posts_page])
    @bump = UserItemBump.new
  end

  def check_username
    username = params[:username].downcase
    data = {exist: User.find_by(user_name: username) ? true : false}
    render json: data, status: :ok
  end

  private

    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation)
    end
end
