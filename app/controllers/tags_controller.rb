class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @tags = Tag.all
  end

  def show
    @projects = @tag.projects
  end

  def new
    @categories = Category.all
    @tags = Tag.where.not(type: "Category")
    @tags.each { |tag| tag.build_tag_category unless tag.category }
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(
      name: tag_params[:name],
      type: tag_params[:type],
      category: set_category(tag_params[:category][:id]))
    if @tag.save
      flash[:notice] = 'タグを作成しました。'
    else
      error_messages = @tag.errors.full_messages.join("\n")
      flash[:alert] = "タグの作成に失敗しました。#{error_messages}"
    end
    redirect_to new_tag_path
  end

  def update
    if @tag.update( name: tag_params[:name],
                    type: tag_params[:type],
                    category: Category.find(tag_params[:category][:id]))
      flash[:notice] = 'タグを更新しました。'
    else
      error_messages = @tag.errors.full_messages.join("\n")
      flash[:alert] = "タグの更新に失敗しました。#{error_messages}"
    end
    redirect_to new_tag_path
  end

  def destroy
    if @tag.destroy
      flash[:notice] = 'タグを削除しました。'
    else
      flash[:alert] = 'タグの削除に失敗しました。'
    end
    redirect_to new_tag_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :type, category: [:id])
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def set_category(category_id)
    return nil if category_id.blank?
    Category.find(category_id)
  end
end
