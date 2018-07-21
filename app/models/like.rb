class Like < ApplicationRecord
  belongs_to :user
  belongs_to :project, counter_cache: :likes_count
end
