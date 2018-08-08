class Project < ApplicationRecord
  validates :next_goal, numericality: { greater_than: :goal }
  belongs_to :user
  has_many :returns, dependent: :destroy
  accepts_nested_attributes_for :returns, allow_destroy: true

  has_many :tag_projects, dependent: :destroy
  has_many :tags, through: :tag_projects

  mount_uploader :projectimage, ProjectimageUploader
  has_many :likes, dependent: :destroy
  enum project_type: { purchase: 0, contribution: 1 }

  scope :active,     ->         { where('limit_date >= ?', Time.current) }
  scope :title,      -> title   { where('title like ?', title) }
  scope :content,    -> content { where('content like ?', content) }
  scope :owner_name, -> name    { joins(:user).where('users.nickname like ?', name) }
  scope :order_new,  ->         { sort_by{ |project| project.created_at }.reverse }
  # お気に入り機能が実装されるまでコメントアウト
  # scope :order_like_count -> { sort_by{ |project| project.likes_count }.reverse }
  scope :order_total_support, -> { sort_by{ |project| project.total_support }.reverse }
  scope :search,     -> keyword {
    title(keyword).or(content(keyword)).joins(:user).or(owner_name(keyword))
  }
  scope :one_more_push, -> {
    select{ |project|
     project.achievement_rate >= 40 && project.remaining_time[:day] <= 30
    }
    .sort_by{ |project| project.remaining_time.inject(:+) }
  }

  # 募集中かどうかを判定
  def active?
    @limit_date = self.limit_date
    days_life_date = limit_date - Time.current
    @days_life = (days_life_date / 24 / 60 / 60).to_i
    @days_life >= 0
  end

  def success?
    self.total_support >= self.goal
  end

  def category
    self.tags.find_by(type: 'category')
  end

  def category_add(category_id)
    return false if self.category
    return false if category_id.blank?
    self.tags << Category.find(category_id)
  end

  def category_delete
    self.tag_projects.find_by(tag_id: self.category.id).delete
  end

  def achievement_rate
    return 0 if self.total_support == 0
    ((self.total_support.to_f / self.goal.to_f) * 100).floor
  end

  def achievement_rate_next_goal
    return 0 if self.total_support == 0
    ((self.total_support.to_f / self.next_goal.to_f) * 100).floor
  end

  def strech_rate
    ((self.goal.to_f / self.next_goal.to_f) * 100).floor
  end
  # ユーザーがすでにいいねをしているか
  def like_user(user_id)
   likes.find_by(user_id: user_id)
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

  # リターン購入分の合計値を(リターン金額と数量)で算出し、合計金額を返す。
  # params_number(hash配列) : key(return_id):value(count)
  def self.return_sum(params_number)
    sum = 0
    params_number.each do |key, value|
      unless value.to_i == 0
        return_item = Return.find(key)
        sum += return_item.price * value.to_i
      end
    end
    return sum
  end

  # 対象プロジェクトの各リターンの中で支援者数が一番多い人数を返却
  # returns : 対象プロジェクトのリターンオブジェクト
  def total_user_max(returns)
    total_user_max = 0
    returns.each do |return_item|
      if total_user_max < return_item.total_user
        total_user_max = return_item.total_user
      end
    end
    return total_user_max
  end

  def has_max_return?
    self.returns.length  <= 3
  end
end
