class StaticPagesController < ApplicationController
  before_action :user_logged_in, except: [:privacy]
  def home
    @post = Post.new
    @comment = Comment.new
    friend_ids = current_user.friend_ids
    @posts = Post.where("user_id IN (?) OR user_id = ?", friend_ids, current_user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 7)
  end

  def notifications
  end

  def privacy
  end
end
