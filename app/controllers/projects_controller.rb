class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:new, :edit]
  before_action :require_login, except: [:index, :show]

  def index
    return @projects = Project.active if project_search_params[:keyword].empty?

    keywords = project_search_params[:keyword].gsub(/[[:blank:]]+/, "\s")
                                              .split(/\s/)
    keywords.each do |word|
      match_projects = Project.active
                              .joins(:user)
                              .where("title             like :word
                                      OR content        like :word
                                      OR users.nickname like :word",
                                      word: "%#{word}%")

      next @projects = match_projects unless @projects
      @projects = @projects.or(match_projects)
    end
  end

  def show
    view_history = cookie_find_or_create("project_view_history")
    view_history.delete_if { |id| id = @project.id }
    view_history << @project.id
    cookie_save("project_view_history", view_history)
    @returns = @project.returns.order('price ASC' )
    @tags = @project.tags
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
    @returns = @project.returns
  end

  def update
    if @project.update(update_project_params)
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

  def set_tags
    @tags = Tag.all
  end

  def project_search_params
    params.fetch(:search, {}).permit(:keyword)
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
      tag_ids: [],
      returns_attributes: [:title, :price, :content, :stock, :arrival_date, :returnimage]
    ).merge(testdata)
  end

  def update_project_params
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
      tag_ids: [],
      returns_attributes: [:title, :price, :content, :stock, :arrival_date, :returnimage, :_destroy, :id]
    ).merge(testdata)
  end

  def require_login
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
