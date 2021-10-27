class LikingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    user = User.find(params[:user_id])
    micropost = Micropost.find(params[:micropost_id])
    liking = micropost.likings.build(user: user)
    if liking.save
      flash[:success] = "いいねに成功しました"
    else
      flash[:failure] = "いいねに失敗しました"
    end
    redirect_to root_url
  end
end
