# Preview all emails at http://localhost:3000/rails/mailers/ranking
class RankingPreview < ActionMailer::Preview
  def send_ranking_email
    user = User.first
    likings_counts = Liking.group(:micropost_id).order(count_all: :desc).limit(10).count
    microposts = Micropost.preload(:user).where(id: likings_counts.keys).index_by(&:id)

    microposts_with_likings_count = likings_counts.map do |micropost_id, likings_count|
      { micropost: microposts[micropost_id], likings_count: likings_count }
    end

    RankingMailer.send_ranking_email(user, microposts_with_likings_count)
  end
end
