class PostsController < ApplicationController
  require 'will_paginate/array'

  before_action only: :destroy do
    logged_in_user
    correct_user
  end

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
    @posts = Post.sort_by_score.paginate(page: params[:page])
    @bump = UserItemBump.new
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
      if logged_in?
        params.require(:post).permit(:title, :content, :link).merge(user_id: current_user.id)
      else
        params.require(:post).permit(:title, :content, :link)
      end
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

    def request_from_post
      URI(request.referrer).path == post_path(@post)
    end
end
