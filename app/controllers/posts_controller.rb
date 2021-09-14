class PostsController < ApplicationController
  def new; end
  
  def index
    @posts = Post.all
  end
end
