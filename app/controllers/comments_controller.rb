class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_url
      flash[:success] = "You have created a new comment"
    else
      flash[:danger] = "Your comment has not been saved"
      redirect_to root_url
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
