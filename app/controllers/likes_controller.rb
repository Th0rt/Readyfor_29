class LikesController < ApplicationController

  def create
    @like = Like.create(user_id: current_user.id, project_id: params[:project_id])
    @likes = Like.where(project_id: params[:project_id])
    @projects = Project.all
    @project = Project.find(params[:project_id])
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, project_id: params[:project_id])
    like.destroy
    @likes = Like.where(project_id: params[:project_id])
    @projects = Project.all
    @project = Project.find(params[:project_id])
  end

end
