class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    if user_signed_in?
      @comment = current_user.comments.build
      @following_users = current_user.following_users
    end
    @micropost = Micropost.find(params[:micropost_id])
    @comments = @micropost.comments.paginate(page: params[:page])
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      flash[:success] = "コメントの書き込みに成功しました"
      CommentNotifierMailer.send_comment_email(comment.micropost.user, comment.micropost_id).deliver
    else
      flash[:failure] = "コメントの書き込みに失敗しました"
    end
    redirect_to comments_path(micropost_id: comment.micropost_id)
  end

  private
    def comment_params
      params.require(:comment).permit(:user_id, :micropost_id, :content)
    end
end
