class UsersController < ApplicationController
  before_action :user_logged_in, only: [:show]
  def show
    @user = User.find(params[:id])
  end
end
