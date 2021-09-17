module PostsHelper
  def see_comments_caption(post)
    return "No comments yet" unless post.comments.present?
    
    "See All #{post.comments.count} Comments"
  end
end
