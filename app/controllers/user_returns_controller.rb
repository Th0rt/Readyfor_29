class UserReturnsController < ApplicationController
  def create
    if UserReturn.create(user_return_params)
      render "returns/done"
    end
  end

  private
  def user_return_params
    params.require(:user_return).permit(
      addresses_attributes: [:count, return_id: params[:return_id],
      user_id: current_user.id])
  end
end
