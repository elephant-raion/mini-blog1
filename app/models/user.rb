class User < ApplicationRecord
  has_many :microposts
  has_many :followings
  has_many :following_users, through: :followings
  validates :name, presence: true, length: {maximum: 20}, format: {with: /\A[a-zA-Z]+\z/}
  validates :profile, length: {maximum: 200}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # allow users to update their accounts without passwords
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

end
