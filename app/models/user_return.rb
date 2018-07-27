class UserReturn < ApplicationRecord
  belongs_to :user
  belongs_to :return

  # 購入するリターンごとにinsert(create)するためのUserReturnオブジェクトを生成し配列で返す。
  # params_number(hash配列) : key(return_id):value(count)
  # params_user_id(hash) : user_id
  def self.user_return_array(params_number, params_user_id)
    user_returns = []
    params_number.each do |key, value|
      unless value.to_i == 0
        user_returns << UserReturn.new(count: value.to_i, return_id: key.to_i, user_id: params_user_id)
      end
    end
    return user_returns
  end

  def self.count_return_users
    self.pluck(:user_id).uniq.count
  end
end
