class Return < ApplicationRecord
  belongs_to :project
  mount_uploader :returnimage, ReturnImageUploader
end
