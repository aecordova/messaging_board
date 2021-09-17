class PostsController < ApplicationController

  def create
    post = current_user.posts.new(post_params)
    if post.save
      redirect_back fallback_location: root_path
    else
      flash[:error] = "Post not created"
      redirect_back fallback_location: root_path
    end
  end
  
  def index
    @posts = Post.includes(:author).most_recent_first
  end

  def show
    post
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def post
    @post = Post.find(params[:id])
  end
end
