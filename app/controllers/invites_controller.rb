class InvitesController < ApplicationController
  def index
  end

  def accept_invite
    user = User.find(params[:id])
    if current_user.requested_friends.include?(user)
      current_user.accept_request(user)
      flash[:success] = "#{user.username} #{t('friends.add')}"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def decline_invite
    user = User.find(params[:id])
    if current_user.requested_friends.include?(user)
      current_user.decline_request(user)
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
