class Like < ApplicationRecord
  belongs_to :user
  belongs_to :project, counter_cache: :likes_count
  def like_project_supporters
    @returns = self.project.returns
    total_supporter = 0
    @returns.each do |r|
      total_supporter = r.total_user if r.total_user > total_supporter
    end
    return total_supporter
  end
end
