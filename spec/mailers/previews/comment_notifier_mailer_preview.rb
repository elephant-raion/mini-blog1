# Preview all emails at http://localhost:3000/rails/mailers/comment_notifier_mailer
class CommentNotifierMailerPreview < ActionMailer::Preview
  def send_comment_email
    user = User.first
    micropost_id = user.microposts.first.id
    CommentNotifierMailer.send_comment_email(user, micropost_id)
  end
end
