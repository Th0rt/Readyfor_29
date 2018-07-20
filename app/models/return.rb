class Return < ApplicationRecord
  belongs_to :project
  has_many :users, through: :user_returns
  mount_uploader :returnimage, ReturnImageUploader
end
