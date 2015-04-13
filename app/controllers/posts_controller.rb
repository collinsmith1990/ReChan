class PostsController < ApplicationController
  before_action :logged_in_user, only: :destroy
  before_action :correct_user, only: :destroy

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.current_user = current_user
    if @post.save
      flash[:success] = "Created new post"
      redirect_to(@post)
    else
      render 'new'
    end
  end

  def index
    @posts = Post.paginate(page: params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 100)
    @comment = @post.comments.build(params[:comment])
  end

  def destroy
    flash[:danger] = "Post deleted"
    @post = Post.find(params[:id])
    @post.destroy
    unless request_from_post
      redirect_to request.referrer
    else
      redirect_to root_url
    end
  end

  private
    
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :link)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

    def request_from_post
      URI(request.referrer).path == post_path(@post)
    end
end
