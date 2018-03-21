class StaticPagesController < ApplicationController
  before_action :user_logged_in, except: [:privacy]
  def home
    @post = Post.new
    @comment = Comment.new
    @posts = Post.all.order(created_at: :desc)
  end

  def notifications
  end

  def privacy
  end
end
