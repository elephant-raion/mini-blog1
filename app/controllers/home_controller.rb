class HomeController < ApplicationController

  def index
    if user_signed_in?
      @micropost = current_user.microposts.build
      @following_users = current_user.following_users
    end
    @microposts = Micropost.all.paginate(page: params[:page])
  end
end