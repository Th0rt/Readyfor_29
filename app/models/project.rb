class Project < ApplicationRecord
  belongs_to :user

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
end
