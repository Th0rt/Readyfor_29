class Project < ApplicationRecord
  belongs_to :user
  has_many :returns
  mount_uploader :projectimage, ProjectimageUploader

  # 募集中かどうかを判定
  def active?
    @limit_date = self.limit_date
    days_life_date = limit_date - Time.current
    @days_life = (days_life_date / 24 / 60 / 60).to_i
    @days_life >= 0
  end

  # 終了日をStringで返す
  def limit_date_to_month_day
    if active?
      "#{@days_life}日"
    else
      @limit_date.to_s(:month_day)
    end
  end

  def left_date
    Time.zone.at(self.limit_date - Time.current).strftime("%-d日")
  end

  def achievement_rate
    return 0 if self.total_support == 0
    ((self.total_support.to_f / self.goal.to_f) * 100).floor
  end
end
