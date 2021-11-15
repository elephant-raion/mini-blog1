class CommentsController < ApplicationController
  def index
    @following_users = current_user.following_users
    @micropost = Micropost.find(params[:micropost_id])
    @comments = @micropost.comments.paginate(page: params[:page])
  end
end
