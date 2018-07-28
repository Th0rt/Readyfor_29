class ReturnsController < ApplicationController
  before_action :set_return, only: [:destroy, :confirmation]
  before_action :set_project, only: [:new, :choice, :confirmation]
  before_action :require_login

  # 支払い選択
  def choice
    @returns = @project.returns
    @return = @returns.where(id: params[:select_id])
    @returns_not = @returns.where.not(id: params[:select_id])

    respond_to do |format|
      format.html
      format.json
    end
  end

  # 支払い情報入力
  def information
  end

  # 支払い情報確認
  def confirmation
    @user_return = UserReturn.new
  end

  def new
    @return = Return.new
  end

  def create
    if Return.create(return_params)
      redirect_to project_path(id: params[:project_id])
      flash[:notice] = 'リターンを作成しました。'
    else
      render action: :new
      flash[:alert] = 'リターンの作成に失敗しました。'
    end
  end

  def destroy
    if @return.destroy
      flash[:notice] = 'リターンを削除しました。'
    else
      flash[:alert] = 'リターンの削除に失敗しました。'
    end
    redirect_to edit_project_path(id: params[:project_id])
  end

  private
  def return_params
    params.require(:return).permit(:title,
                                   :price,
                                   :stock,
                                   :content,
                                   :arrival_date,
                                   :returnimage
                                  ).merge(project_id: params[:project_id])
  end

  def set_return
    @return = Return.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end
end
