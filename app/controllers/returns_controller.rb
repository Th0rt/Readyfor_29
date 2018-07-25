class ReturnsController < ApplicationController
  before_action :set_return, only: [:destroy]
  before_action :set_project, only: [:new, :choice, :confirmation]

  # 支払い選択
  def choice
    @returns = @project.returns
  end

  # 支払い情報入力
  def information
  end

  # 支払い情報確認
  def confirmation
    @user_return = UserReturn.new
    @return = Return.find(params[:id])
  end

  def new
    @return = Return.new
  end

  def create
    Return.create(return_params)
    redirect_to project_path(id: params[:project_id])
  end

  def destroy
    @return.destroy
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
