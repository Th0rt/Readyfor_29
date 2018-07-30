class UserReturnsController < ApplicationController
  def create
    @return = Return.find(params[:return_id])
    @project = @return.project

    return_sum = Project.return_sum(user_return_params[:number])
    # 決済処理
    if !params['payjpToken'] == '' && Payjp::Charge.create(currency: 'jpy', amount: return_sum, card: params['payjpToken'])
      # 初めてリターン購入した人ならばtotal_userに1足す、リターン購入分のレコード保存、プロジェクトのtotal_supportに購入金額分を加算
      if Return.total_user_sum(user_return_params[:number], current_user.id)
        if UserReturn.import UserReturn.user_return_array(user_return_params[:number], user_return_params[:user_id])
          if @project.update(total_support: @project.total_support += return_sum)
              render 'returns/done'
          end
        end
      end
    else
      flash[:alert] = '決済処理に失敗しました。もう一度やり直してください。'
      redirect_to project_path(params[:project_id])
    end
  end

  private
  def user_return_params
    {number: params[:user_return][:number], return_id: params[:return_id], user_id: current_user.id}
  end
end
