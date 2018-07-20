class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @projects = Project.all
  end

  def show
    view_history = cookie_find_or_create("project_view_history")
    view_history.delete_if { |id| id = @project.id }
    view_history << @project.id
    cookie_save("project_view_history", view_history)
    @returns = @project.returns
  end

  def new
    @project = Project.new
    @project.returns.build
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
    testdata = {likes_count: 0, user_id: current_user.id}

    params.require(:project).permit(
      :title,
      :content,
      :limit_date,
      :goal,
      :next_goal,
      :limit_date,
      :projectimage,
      :project_type,
      returns_attributes: [:title, :price, :content, :stock, :arrival_date, :returnimage]
    ).merge(testdata)
  end

  def require_login
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
