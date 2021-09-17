class CommentsController < ApplicationController
  def create
    comment = post.comments.new(comment_params)
    redirect_to posts_path if comment.save
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(author_id: current_user.id)
  end

  def post
    @post = Post.find(params[:post_id])
  end
end
