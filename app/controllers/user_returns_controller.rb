class UserReturnsController < ApplicationController
  def create
    @return = Return.find(params[:return_id])
    @project = @return.project
    if UserReturn.create(user_return_params)
      render "returns/done"
    end
    @project.update(total_support: @project.total_support += 1000)
  end

  private
  def user_return_params
    params.require(:user_return).permit(:count).merge(return_id: params[:return_id], user_id: current_user.id)
  end
end
