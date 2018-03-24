class UsersController < ApplicationController
  before_action :user_logged_in, only: [:show]
  before_action :correct_user, only: [:edit_profile, :update_profile]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 7)
    @comment = Comment.new
  end

  def edit_profile
    @user = User.find(params[:id])
    @posts = @user.posts.all.order(created_at: :desc).paginate(:page => params[:page], :per_page => 7)
    @comment = Comment.new
  end

  def update_profile
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      flash[:success] = t('edit-profile.save')
      redirect_to user
    else
      redirect_to edit_profile_url(user)
    end
  end

  def sign
  end

  ## Generate a new avatar
  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      flash[:success] = t('edit-profile.new_avatar')
      redirect_to edit_profile_url(user)
    else
      redirect_to edit_profile_url(user)
    end
end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation,
                                   :bio, :location, :birthday, :avatar_url)
    end

    def correct_user
      user = User.find(params[:id])
      unless current_user == user
        redirect_to root_url
      end
    end
end
