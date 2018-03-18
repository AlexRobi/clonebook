class FriendsController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def send_request
    user = User.find(params[:id])
    if current_user.friend_request(user)
      flash[:info] = "#{t('friends.send')} #{user.username}"
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.friends_with?(current_user)
      current_user.remove_friend(user)
      flash[:danger] = "#{user.username} #{t('friends.remove')}"
      redirect_to current_user
    end
  end
end
