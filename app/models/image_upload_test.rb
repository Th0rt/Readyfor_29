class ImageUploadTest < ApplicationRecord
  mount_uploader :image, ImageUploader
end
