module UserItemBumpsHelper

  def render_bump_forms_for(post)
    if current_user
      unless post.bumped_users.include?(current_user)
        render "user_item_bumps/bump_form", post: post
      else
        render "user_item_bumps/debump_form", post: post
      end
    end
  end
end
