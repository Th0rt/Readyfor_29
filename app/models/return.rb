class Return < ApplicationRecord
  validates :title,
    presence: true,
    length: { maximum: 30 }

  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :content,
    presence: true,
    length: { maximum: 150 }

  validates :stock,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  validates :returnimage,
    presence: true

  validates :arrival_date,
    presence: true

  validate :arrival_date_is_not_before_today

  def arrival_date_is_not_before_today
    return false unless arrival_date
    if arrival_date < Time.zone.today
      errors.add(:arrival_date, 'に過去の日付は指定できません')
    end
  end

  belongs_to :project
  has_many :user_returns, dependent: :destroy
  has_many :users, through: :user_returns
  mount_uploader :returnimage, ReturnImageUploader

  # 初めて購入したリターンの場合、total_userに加算する
  # params_number(hash配列) : key(return_id):value(count)
  # current_user_id(int)) : 現在ログインしているuser_id
  def self.total_user_sum(params_number, current_user_id)
    params_number.each do |key, value|
      unless value.to_i == 0
        return_item = Return.find(key)
        user_returns = UserReturn.where("(return_id = ?) AND (user_id = ?)", return_item.id, current_user_id)
        return return_item.update(total_user: return_item.total_user += 1) if user_returns.count == 0
      end
    end
  end

  def return_active?
    self.stock >= 1
  end
end
