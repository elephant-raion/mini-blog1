class CommentNotifierMailer < ApplicationMailer
  default :from => 'toreharose@gmail.com'

  def send_comment_email(user, micropost)
    @user = user
    @micropost = micropost
    mail( :to => @user.email, :subject => 'あなたの投稿にコメントが書かれました')
  end
end
