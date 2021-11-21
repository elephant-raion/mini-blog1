class LikingUsersController < ApplicationController
  def index
    micropost = Micropost.find(params[:micropost_id])
    @liking_users = micropost.users
  end
end
