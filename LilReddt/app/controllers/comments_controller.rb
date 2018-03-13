class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
    render :edit
  end

  def update
  end

  def create
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.post_id = params[:comment][:post_id]
    comment.save
    flash[:errors] = comment.errors.full_messages
    redirect_to post_url(comment.post)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
