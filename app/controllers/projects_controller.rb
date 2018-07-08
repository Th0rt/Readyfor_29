class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Prototype.new(project_params)
    if @project.save

    else
      render action: :new
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :title,
      :content,
      :limit_date,
      :goal,
      :next_goal
    )
  end
end
