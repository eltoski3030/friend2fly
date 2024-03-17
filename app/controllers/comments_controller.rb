class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:destroy]
  before_action :check_user, only: [:destroy]

  def create
    @destination = Destination.find(params[:destination_id])
    @comment = @destination.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @destination, notice: 'Your comment was successfully posted.'
    else
      redirect_to @destination, alert: 'Error posting your comment.'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @comment.destination, notice: 'Comment was successfully deleted.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user
    set_comment
    unless current_user == @comment.user
      redirect_to root_path, alert: "You are not authorized to delete this comment."
    end
  end

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end
end

