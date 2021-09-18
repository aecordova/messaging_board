class PostsController < ApplicationController

  def create
    post = current_user.posts.new(post_params)
    if post.save
      flash[:success] = "Message Created Successfully"
    else
      flash[:error] = error_messages(post)
    end
    
    redirect_back fallback_location: root_path
  end
  
  def index
    @posts = Post.includes(:author, :comments).most_recent_first
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
