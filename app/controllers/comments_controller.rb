class CommentsController < ApplicationController
  def create
    comment = post.comments.build(comment_params)
    if comment.save
      flash[:success] = "Comment Added Successfully"
    else
      flash[:error] = error_messages(comment)
    end

    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(author_id: current_user.id)
  end

  def post
    @post = Post.find(params[:post_id])
  end
end
