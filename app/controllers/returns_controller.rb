class ReturnsController < ApplicationController
  def payment1
  end

  def payment2
  end

  def payment3
  end

  def payment4
  end

  def new
    @project = Project.find(params[:project_id])
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
end
