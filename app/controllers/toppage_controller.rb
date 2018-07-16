class ToppageController < ApplicationController
  def index
    @projects = Project.all
    view_history = cookie_find_or_create("project_view_history")
    @recent_viewed_projects = Project.where(id: view_history)
                                     .order(['field(id, ?)', view_history])

    @large_amount_projects = @projects.sort_by{ |project| project.total_support }
                                      .reverse
                                      .first(4)
  end

  def socialgood
  end

  def local
  end

  def product
  end

  def art
  end

  def challenge
  end
end
