class FollowingUserMicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @following_users = current_user.following_users
    @microposts = Micropost.preload(%i[user users]).where(user: @following_users).order(created_at: :desc).paginate(page: params[:page])
  end
end
