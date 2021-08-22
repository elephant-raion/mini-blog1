class MicropostsController < ApplicationController

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
    end
    redirect_to root_url
  end

  def index
    @feed_items = Micropost.all.paginate(page: params[:page])
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
