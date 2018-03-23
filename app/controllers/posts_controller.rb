class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_url
      flash[:success] = t('post.save')
    else
      redirect_to root_url
      flash[:danger] = t('post.error')
    end
  end

  def liked
    @post = Post.find(params[:id])
    @post.liked_by(current_user)
    redirect_back(fallback_location: root_path)
  end

  def unliked
    @post = Post.find(params[:id])
    @post.unliked_by(current_user)
    redirect_back(fallback_location: root_path)
  end

  def liked_posts
    @comment = Comment.new
    @user = User.find(params[:id])
    @posts = @user.get_voted(Post).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15)
  end

  private

    def post_params
      params.require(:post).permit(:body, :user_id)
    end
end
