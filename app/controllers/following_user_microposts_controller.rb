class FollowingUserMicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @following_users = current_user.following_users
    @microposts = Micropost.preload(:user).where(user: @following_users).paginate(page: params[:page])
  end
end
