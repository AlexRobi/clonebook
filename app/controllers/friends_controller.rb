class FriendsController < ApplicationController
  def index
    @user = User.find(params[:id])
  end

  def send_request
    user = User.find(params[:id])
    if current_user.friend_request(user)
      redirect_to user
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.friends_with?(current_user)
      current_user.remove_friend(user)
      redirect_to user
    end
  end
end
