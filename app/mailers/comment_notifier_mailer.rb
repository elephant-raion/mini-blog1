class CommentNotifierMailer < ApplicationMailer
  def send_comment_email(user, micropost)
    @user = user
    @micropost = micropost
    bootstrap_mail(to: @user.email, subject: 'あなたの投稿にコメントが書かれました')
  end
end
