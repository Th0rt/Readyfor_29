class Project < ApplicationRecord

  # 募集期間内(残り日数を返す)、募集期間終了(終了日を返す)
  def days_life
    limit_date = self.limit_date
    days_life_date = limit_date - Time.current
    days_life = (days_life_date / 24 / 60 / 60).to_i
    if days_life >= 0
      "#{days_life}日"
    else
      limit_date.to_s(:month_day)
    end
  end
end
