class RankingMailer < ApplicationMailer
  def send_ranking_email(user, microposts_with_likings_count)
    @microposts_with_likings_count = microposts_with_likings_count
    mail(to: user.email, subject: '前日のいいね数ランキング')
  end
end
