class MicropostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      redirect_to new_user_session_url
    end

  end

  def index
    @microposts = current_user.microposts.order(created_at: :desc).paginate(page: params[:page])
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :image)
    end
end
