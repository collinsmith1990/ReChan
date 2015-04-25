class UserItemBumpsController < ApplicationController
  before_action only: :create do
    logged_in_user
  end
  before_action only: :destroy do
    logged_in_user
    correct_user
  end

  def create
    @bump = UserItemBump.new(user_item_bump_params)
    if @bump.save
      redirect_to request.referrer
    end
  end

  def destroy
    @bump = UserItemBump.find(params[:id])
    @bump.destroy
    redirect_to request.referrer
  end

  private

    def user_item_bump_params
        params.require(:user_item_bump).permit(:post_id).merge(user_id: current_user.id)
    end

    def correct_user
      @post = current_user.user_item_bumps.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
