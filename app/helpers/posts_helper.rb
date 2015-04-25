module PostsHelper

  def link_to_post(post)
    unless post.link
      link_to post.title, post_path(post), class: "#{post.type}-title"
    else
      link_to post.title, post.link, class: "#{post.type}-title"
    end
  end
end
