class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.reject(&:new_record?)
    @comment = @post.comments.build(params[:comment])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "Created new post"
      redirect_to(@post)
    else
      render 'new'
    end
  end

  private
    
    def post_params
      params.require(:post).permit(:title, :content, :user_id, :link)
    end
end
