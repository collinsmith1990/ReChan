module CommentsHelper

  def commenter_name(comment)
    if comment.commenter
      comment.commenter
    else
      "Anonymous"
    end
  end
end
