# Preview all emails at http://localhost:3000/rails/mailers/ranking
class RankingPreview < ActionMailer::Preview
  def send_ranking_email
    user = User.first
    microposts_with_likings_count = Micropost
                                    .left_joins(:likings)
                                    .group(:id)
                                    .select('microposts.*, count(likings.id) as likings_count')
                                    .where("likings.created_at <= ?", Date.yesterday.end_of_day)
                                    .order("likings_count desc")
                                    .limit(10)
                                    .preload(:user)

    RankingMailer.send_ranking_email(user, microposts_with_likings_count)
  end
end
