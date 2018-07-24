class LikesController < ApplicationController

  before_action :set_project, only: [:create, :destroy]

  def create
    @like = Like.create(user_id: current_user.id, project_id: params[:project_id])
    @likes = Like.where(project_id: params[:project_id])
    # @like = current_user.likes.create(project_id: params[:project_id])
    @projects = Project.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, project_id: params[:project_id])
    # like = current_user.likes.find_by(project_id: params[:project_id])
    like.destroy
    @likes = Like.where(project_id: params[:project_id])
    @projects = Project.all
  end

  private

  def set_project
   @project = Project.find(params[:project_id])
  end
end
