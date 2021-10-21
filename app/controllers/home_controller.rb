class HomeController < ApplicationController

  def index
    @micropost = current_user.microposts.build if user_signed_in?
    @feed_items = Micropost.all.paginate(page: params[:page])
  end
end
