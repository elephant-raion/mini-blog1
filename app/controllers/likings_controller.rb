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

    previous_path = Rails.application.routes.recognize_path(request.referer)
    if previous_path[:controller] == 'home' && previous_path[:action] == 'index'
      redirect_to root_url
    elsif previous_path[:controller] == 'following_user_microposts' && previous_path[:action] == 'index'
      redirect_to following_user_microposts_path
    end
  end
end
