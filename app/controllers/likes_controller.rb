class LikesController < ApplicationController
  def create
    @project = Project.find(params[:params_id])
    @project.iine(current_user)
  end

  def destroy
    @project = Like.find(params[:id]).project
    @project.uniine(current_user)
  end
end
