class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_tags, only: [:new, :create, :edit, :update]
  before_action :set_returns, only: [:edit, :update]
  before_action :set_categories, only: [:new, :create, :edit, :update]
  before_action :require_login, except: [:index, :show]

  def index
    @projects = Project.active
    return false if project_search_params[:keyword].blank?

    keywords = project_search_params[:keyword].gsub(/(\S+)/, '%\0%').split(/\s/)
    keywords.each do |word|
      @projects = @projects.search(word)
    end
  end

  def show
    view_history = cookie_find_or_create("project_view_history")
    view_history.delete_if { |id| id = @project.id }
    view_history << @project.id
    cookie_save("project_view_history", view_history)
    @like = @project.likes.find_by(user_id: current_user.id) if user_signed_in?
    @returns = @project.returns.order('price ASC' )
    @category = @project.category
    @tags = @project.tags
    @total_user_max = @project.total_user_max(@returns)
  end

  def new
    @project = Project.new
    @project.returns.build
  end

  def create
    @project = Project.new(project_params)
    @project.category_add(project_params[:category_id])
    if @project.save
      redirect_to root_path
      flash[:notice] = 'プロジェクトを作成しました。'
    else
      flash.now[:alert] = generate_error_messages(@project, "プロジェクトの作成に失敗しました")
      render action: :new
    end
  end

  def edit
    @user_project = Project.where(id: params[:id], user_id: current_user.id)
    redirect_to root_path if @user_project.blank?
    @returns = @project.returns
  end

  def update
    if @project.update(update_project_params)
      if @project.category && @project.category.id == project_params[:category_id]
        @project.category_delete
      end
      @project.category_add(project_params[:category_id])
      redirect_to root_path
      flash[:notice] = 'プロジェクトを更新しました。'
    else
      flash.now[:alert] = generate_error_messages(@project, "プロジェクトの更新に失敗しました")
      render action: :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to root_path
      flash[:notice] = 'プロジェクトを削除しました。'
    else
      flash[:alert] = 'プロジェクトの削除に失敗しました。'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def set_tags
    @tags = Tag.where.not(type: 'Category')
  end

  def set_categories
    @categories = Category.all
  end

  def set_returns
    @returns = @project.returns
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
      :category_id,
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
      :category_id,
      tag_ids: [],
      returns_attributes: [:title, :price, :content, :stock, :arrival_date, :returnimage, :_destroy, :id]
    ).merge(testdata)
  end
end
