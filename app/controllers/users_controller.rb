class UsersController < ApplicationController
  before_action :user_logged_in, only: [:show]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 15)
    @comment = Comment.new
  end

  def sign
  end
end
