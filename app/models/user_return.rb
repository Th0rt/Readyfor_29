class UserReturn < ApplicationRecord
  belongs_to :user
  belongs_to :return

  def self.user_return_array(params_number, params_user_id)
    user_returns = []
    params_number.each do |key, value|
      unless value.to_i == 0
        user_returns << UserReturn.new(count: value.to_i, return_id: key.to_i, user_id: params_user_id)
      end
    end
    return user_returns
  end
end
