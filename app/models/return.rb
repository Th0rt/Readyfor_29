class Return < ApplicationRecord
  belongs_to :project
  has_many :user_returns
  has_many :users, through: :user_returns
  accepts_nested_attributes_for: user_returns
  mount_uploader :returnimage, ReturnImageUploader
end
