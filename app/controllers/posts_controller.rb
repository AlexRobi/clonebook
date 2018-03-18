class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
      flash[:success] = "You have created a new post"
    end
  end

  private

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
