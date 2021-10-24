class FollowingUserMicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @following_users = current_user.following_users if user_signed_in?
    @feed_items = Micropost.preload(:user).where(user: current_user.following_users).paginate(page: params[:page])
  end
end
