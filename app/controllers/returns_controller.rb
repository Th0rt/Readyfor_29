class ReturnsController < ApplicationController
  before_action :set_return, only: [:destroy]
  before_action :set_project, only: [:new, :destroy]
  def new
    @return = Return.new
  end

  def create
    Return.create(return_params)
    redirect_to project_path(id: params[:project_id])
  end

  def destroy
    @return.destroy
    @returns = @project.returns
    if @returns.present?
      redirect_to root_path
    else
      redirect_to edit_project_path(id: params[:project_id])
    end
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
