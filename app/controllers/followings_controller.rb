class FollowingsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    following_params = params.require(:following).permit(:following_user_id)
    following = current_user.followings.build(following_params)
    if following.save
      flash[:success] = "フォローに成功しました"
    else
      flash[:failure] = "フォローに失敗しました"
    end
    redirect_to root_url
  end
end
