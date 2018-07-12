class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

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

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to root_path
    else
      render action: :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to root_path
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    testdata = {project_type: "購入型", likes_count: 0, user_id: current_user.id}

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
