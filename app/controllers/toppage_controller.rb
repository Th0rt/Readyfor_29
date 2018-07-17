class ToppageController < ApplicationController
  before_action :set_projects_all,
                :set_projects_nortable,
                :set_projects_large_amount,
                :set_projects_new

  def index
    view_history = cookie_find_or_create("project_view_history")
    @recent_viewed_projects = Project.where(id: view_history)
                                     .order(['field(id, ?)', view_history])
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

  private

  def set_projects_all
    @projects = Project.all
  end

  def set_projects_new
    # NOTE: 全プロジェクトを渡しているのがパフォーマンス的に良くないと思うので、あとで修正したい。
    @projects_new = @projects.sort_by{ |project| project.created_at }
                             .reverse
  end

  def set_projects_nortable
    @projects_nortable = @projects
  end

  def set_projects_large_amount
    @projects_large_amount = @projects.sort_by{ |project| project.total_support }
                                      .reverse
                                      .first(4)
  end
end
