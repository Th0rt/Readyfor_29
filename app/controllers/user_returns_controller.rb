class UserReturnsController < ApplicationController
  def create
    @return = Return.find(params[:return_id])
    @project = @return.project

    user_returns = []
    sum = 0
    user_return_params[:number].each do |key, value|
      unless value.to_i == 0
        user_returns << UserReturn.new(count: value.to_i, return_id: key.to_i, user_id: user_return_params[:user_id])
        return_item = Return.find(key)
        sum += return_item.price * value.to_i
      end
    end

    if UserReturn.import user_returns
      if @project.update(total_support: @project.total_support += sum)
        render 'returns/done'
      end
    end
  end

  private
  def user_return_params
    {number: params[:user_return][:number], return_id: params[:return_id], user_id: current_user.id}
  end
end
