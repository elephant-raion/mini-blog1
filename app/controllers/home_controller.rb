class HomeController < ApplicationController

  def index
    if user_signed_in? then
      @micropost = current_user.microposts.build
      @following_users = current_user.following_users
    end
    @feed_items = Micropost.all.paginate(page: params[:page])
  end
end