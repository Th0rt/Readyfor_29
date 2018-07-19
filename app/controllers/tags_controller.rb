class TagsController < ApplicationController
  def index
    if params[:tag_id]
      @tag = Tag.find(params[:tag_id])
      @projects = @tag.projects
    else
      @projects = Project.all
    end
  end
end
