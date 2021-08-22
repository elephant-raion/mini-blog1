class HomeController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    @micropost = current_user.microposts.build
    @feed_items = current_user.microposts.paginate(page: params[:page])
  end
end
