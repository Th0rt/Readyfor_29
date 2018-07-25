class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :update, :destroy]

  def index
    @tags = Tag.all
  end

  def show
    @projects = @tag.projects
  end

  def new
    @tags = Tag.where.not(type: "Category")
    @categories = Category.all
    @tag = Tag.new
  end

  def create
    tag = Tag.create(
      name: tag_params[:name],
      type: tag_params[:type],
      category: Category.find(tag_params[:category[:id]]))
    redirect_to new_tag_path
  end

  def update
    @tag.update(tag_params)
    redirect_to new_tag_path
  end

  def destroy
    @tag.destroy
    redirect_to new_tag_path
  end

  private

  def tag_params
    params.require(:tag).permit(:name, :type, :category[:id])
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
