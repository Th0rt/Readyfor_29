class ReturnsController < ApplicationController
  before_action :set_return, only: [:payment1, :payment2, :payment3, :payment4]
  before_action :set_project, only: [:new, :payment1, :payment2, :payment3, :payment4]

  def payment1
  end

  def payment2
  end

  def payment3
  end

  def payment4
  end

  def new
    @return = Return.new
  end

  def create
    Return.create(return_params)
    redirect_to project_path(id: params[:project_id])
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
