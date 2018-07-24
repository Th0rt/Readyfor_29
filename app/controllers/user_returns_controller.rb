class UserReturnsController < ApplicationController
  def create
    @return = Return.find(params[:return_id])
    @project = @return.project
    if UserReturn.create(user_return_params)
      render "returns/done"
    end

    # 支援総額への加算
    sum = 0
    params[:user_return][:number].each do |key, value|
      return_item = Return.find(key)
      sum += return_item.price * value.to_i
    end
    @project.update(total_support: @project.total_support += sum)
  end

  private
  def user_return_params
    params.require(:user_return).permit(:count).merge(return_id: params[:return_id], user_id: current_user.id)
  end
end
