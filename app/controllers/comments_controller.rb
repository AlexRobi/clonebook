class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to root_url
      flash[:success] = t('comment.save')
    else
      flash[:danger] = t('comment.error')
      redirect_to root_url
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user_id, :post_id)
    end

end
