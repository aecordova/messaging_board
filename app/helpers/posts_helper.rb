module PostsHelper
  def see_comments_caption(post)
    return "No comments yet" unless post.comments.present?
    
    "See Comments [ #{post.comments.count} ]"
  end
end
