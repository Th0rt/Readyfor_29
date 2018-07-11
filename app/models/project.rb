class Project < ApplicationRecord

  # 募集期間内(残り日数を返す)、募集期間終了(終了日を返す)
  def days_left
    limit_date = self.limit_date
    days_left_date = limit_date - Date.today
    days_left = days_left_date.numerator
    if days_left >= 0
      "#{days_left}日"
    else
      limit_date.to_s(:month_day)
    end
  end
end
