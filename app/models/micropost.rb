class Micropost < ApplicationRecord
  belongs_to :user
  has_many :likings
  has_many :users, through: :likings
  has_many :comments
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140}
  mount_uploader :image, ImageUploader

end
