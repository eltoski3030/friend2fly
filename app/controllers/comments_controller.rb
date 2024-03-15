class CommentsController < ApplicationController
    before_action :authenticate_user!
  
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
  
    private
  
    def comment_params
      params.require(:comment).permit(:content, :parent_id)
    end
  end
  
