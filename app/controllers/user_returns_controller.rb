class UserReturnsController < ApplicationController
  def create
  end

  private
  def user_return_params
    params.require(:user_return).permit(:count,
                                  ).merge(return_id: params[:return_id], user_id: current_user.id)
  end
end
