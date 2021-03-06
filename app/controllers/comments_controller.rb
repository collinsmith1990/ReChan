class CommentsController < ApplicationController
  before_action only: :destroy do
    logged_in_user
    correct_user
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.paginate(page: params[:page], per_page: 100)
    @comment = @post.comments.build(comment_params)
    @comment.current_user = current_user
    if @comment.save
      flash[:success] = "Created new comment"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def destroy
    flash[:danger] = "Comment deleted"
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to request.referrer
  end

  private
  
    def comment_params
      if logged_in?
        params.require(:comment).permit(:content).merge(user_id: current_user.id)
      else
        params.require(:comment).permit(:content)
      end
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end
