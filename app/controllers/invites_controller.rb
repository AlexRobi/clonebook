class InvitesController < ApplicationController
  def index
  end

  def accept_invite
    user = User.find(params[:id])
    if current_user.requested_friends.include?(user)
      current_user.accept_request(user)
      flash[:success] = "#{user.username} #{t('friends.add')}"
      redirect_to user
    else
      redirect_to root_url
    end
  end

  def decline_invite
    user = User.find(params[:id])
    if current_user.requested_friends.include?(user)
      current_user.decline_request(user)
      redirect_to invitations_path
    else
      redirect_to root_url
    end
  end
end
