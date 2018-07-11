class ProjectsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  private

  def project_params
    testdata = {project_type: "購入型", likes_count: 0}

    params.require(:project).permit(
      :title,
      :content,
      :limit_date,
      :goal,
      :next_goal,
      :limit_date
    ).merge(testdata)
  end
end
