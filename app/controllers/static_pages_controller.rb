class StaticPagesController < ApplicationController
  before_action :user_logged_in
  def home
  end

  def notifications
  end
end
