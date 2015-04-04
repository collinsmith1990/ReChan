class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :update]
  before_action :correct_user, only: [:destroy, :update]

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.reject(&:new_record?)
    @comment = @post.comments.build(comment_params)
    if @comment.save
      flash[:success] = "Created new comment"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def update
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  private
  
    def comment_params
      params.require(:comment).permit(:content, :user_id)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
