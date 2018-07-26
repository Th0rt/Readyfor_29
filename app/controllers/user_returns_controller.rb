class UserReturnsController < ApplicationController
  def create
    @return = Return.find(params[:return_id])
    @project = @return.project

    # リターン購入分のレコード保存とプロジェクトのtotal_supportに購入金額分を加算する
    if UserReturn.import UserReturn.user_return_array(user_return_params[:number], user_return_params[:user_id])
      if @project.update(total_support: @project.total_support += Project.return_sum(user_return_params[:number]))
        if Return.total_user_sum(user_return_params[:number], current_user.id)
          render 'returns/done'
        end
      end
    end
  end

  private
  def user_return_params
    {number: params[:user_return][:number], return_id: params[:return_id], user_id: current_user.id}
  end
end
