class Following < ApplicationRecord
  belongs_to :user
  belongs_to :following_user, class_name: 'User'
  validates :user, presence: true
  validates :following_user, presence: true
  validates :following_user, uniqueness: { scope: :user }
end
