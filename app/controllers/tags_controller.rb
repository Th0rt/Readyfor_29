class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

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
    tag = Tag.create(
      name: tag_params[:name],
      type: tag_params[:type],
      category: set_category(tag_params[:category][:id]))
    redirect_to new_tag_path
  end

  def update
    @tag.update(
      name: tag_params[:name],
      type: tag_params[:type],
      category: Category.find(tag_params[:category][:id]))
    redirect_to new_tag_path
  end

  def destroy
    @tag.destroy
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
    return nil unless category_id
    Category.find(category_id)
  end
end
