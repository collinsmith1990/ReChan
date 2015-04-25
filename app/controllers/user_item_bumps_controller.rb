class UserItemBumpsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :matching_user_id, only: :create
  before_action :correct_user, only: :destroy

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
      params.require(:user_item_bump).permit(:user_id, :post_id)
    end

    def correct_user
      @post = current_user.user_item_bumps.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
