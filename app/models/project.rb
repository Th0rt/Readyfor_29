class Project < ApplicationRecord
  belongs_to :user
  has_many :returns, dependent: :destroy
  accepts_nested_attributes_for :returns, allow_destroy: true
  mount_uploader :projectimage, ProjectimageUploader
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  enum project_type: { purchase: 0, contribution: 1 }

  # 募集中かどうかを判定
  def active?
    @limit_date = self.limit_date
    days_life_date = limit_date - Time.current
    @days_life = (days_life_date / 24 / 60 / 60).to_i
    @days_life >= 0
  end

  def achievement_rate
    return 0 if self.total_support == 0
    ((self.total_support.to_f / self.goal.to_f) * 100).floor
  end

  # projectをいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  # projectのいいねを解除する
  def uniine(user)
    likes.find_by(user.id).destroy
  end
  
  def remaining_time
    remaining_time = {}
    total_sec = ( self.limit_date - Time.current ).to_i
    remaining_time[:sec]  = total_sec % 60
    remaining_time[:min]  = ( total_sec / 60 ) % 60
    remaining_time[:hour] = ( total_sec / 60 / 60 ) % 24
    remaining_time[:day]  = ( total_sec / 24 / 60 / 60 )
    return remaining_time
  end

end
