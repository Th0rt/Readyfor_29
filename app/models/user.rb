class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :nickname, presence: true, length: { maximum: 10 }

  has_many :projects, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  has_many :likes, dependent: :destroy
  has_many :projects, through: :likes
end
