class FollowingsController < ApplicationController
  def create
    user = User.find(params[:following_user_id])
    following = current_user.followings.build(following_user: user)
    if following.save
      flash[:success] = "フォローに成功しました"
    else
      flash[:failure] = "フォローに失敗しました"
    end
    redirect_to root_url
  end
end
