class UserReturnsController < ApplicationController
  def create
    @return = Return.find(params[:return_id])
    @project = @return.project

    return_sum = Project.return_sum(user_return_params[:number])

    if params[:user_return][:mode] == 'card'
      # 決済処理
      unless params['payjpToken'] == ''
        if Payjp::Charge.create(currency: 'jpy', amount: return_sum, card: params['payjpToken'])
          # 初めてリターン購入した人ならばtotal_userに1足す
          Return.total_user_sum(user_return_params[:number], current_user.id)
          # リターン購入分のレコード保存
          UserReturn.import UserReturn.user_return_array(user_return_params[:number], user_return_params[:user_id], @return)
          # プロジェクトのtotal_supportに購入金額分を加算
          @project.update(total_support: @project.total_support += return_sum)
          # 購入完了画面の表示
          render 'returns/done'
        else
          flash[:alert] = '決済処理に失敗しました。もう一度やり直してください。'
          redirect_to project_path(params[:project_id])
        end
      else
        flash[:alert] = '決済処理に失敗しました。もう一度やり直してください。'
        redirect_to project_path(params[:project_id])
      end
    elsif params[:user_return][:mode] == 'bank'
      Return.total_user_sum(user_return_params[:number], current_user.id)
      UserReturn.import UserReturn.user_return_array(user_return_params[:number], user_return_params[:user_id], @return)
      @project.update(total_support: @project.total_support += return_sum)
      render 'returns/done'
    end
  end

  private
  def user_return_params
    {number: params[:user_return][:number], return_id: params[:return_id], user_id: current_user.id}
  end
end
