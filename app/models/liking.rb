class Liking < ApplicationRecord
  belongs_to :micropost
  belongs_to :user
  validates :user, uniqueness: { scope: :micropost}
end
