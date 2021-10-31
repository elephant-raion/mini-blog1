class LikingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    liking_params = params.require(:liking).permit(:micropost_id, :user_id)
    liking = Liking.new(liking_params)
    if liking.save
      flash[:success] = "いいねに成功しました"
    else
      flash[:failure] = "いいねに失敗しました"
    end
    redirect_to root_url
  end
end
