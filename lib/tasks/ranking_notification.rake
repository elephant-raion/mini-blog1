
namespace :ranking_notification do
  desc '前日のいいね数ランキングを全ユーザに通知する'
  task send_ranking_email: :environment do
    users = User.all
    microposts_with_likings_count = Micropost
                                      .left_joins(:likings)
                                      .group(:id)
                                      .select('microposts.*, count(likings.id) as likings_count')
                                      .where("likings.created_at <= ?", Date.yesterday.end_of_day)
                                      .order("likings_count desc")
                                      .limit(10)
                                      .preload(:user)

    users.each do |user|
      RankingMailer.send_ranking_email(user, microposts_with_likings_count).deliver
    end
  end
end
