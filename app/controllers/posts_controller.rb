class PostsController < ApplicationController

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_to posts_path
    else
      flash[:error] = "Post not created"
      redirect_to posts_path
    end
  end
  
  def index
    @posts = Post.includes(:author).most_recent_first
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
