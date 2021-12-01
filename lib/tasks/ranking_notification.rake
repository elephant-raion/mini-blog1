
namespace :ranking_notification do
  desc '前日のいいね数ランキングを全ユーザに通知する'
  task send_ranking_email: :environment do
    users = User.all
    likings_counts = Liking.group(:micropost_id).order(count_all: :desc).limit(10).count
    microposts = Micropost.preload(:user).where(id: likings_counts.keys).index_by(&:id)

    microposts_with_likings_count = likings_counts.map do |micropost_id, likings_count|
      { micropost: microposts[micropost_id], likings_count: likings_count }
    end

    users.each do |user|
      RankingMailer.send_ranking_email(user, microposts_with_likings_count).deliver
    end
  end
end
