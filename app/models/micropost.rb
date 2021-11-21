class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likings
  has_many :users, through: :likings
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140}
end
