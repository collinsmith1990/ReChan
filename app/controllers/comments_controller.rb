class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.reject(&:new_record?)
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  private
  
    def comment_params
      params.require(:comment).permit(:commenter, :content)
    end
end
