class ToppageController < ApplicationController
  def index
    # NOTE: 各欄ごとにクエリを発行したくないので、allで一括取得して加工する。
    @projects = Project.all

    # NOTE: 全プロジェクトを渡しているのがパフォーマンス的に良くないと思うので、あとで修正したい。
    @new_project = @projects.sort_by{ |project| project.created_at }
                            .reverse

    view_history = cookie_find_or_create("project_view_history")
    @recent_viewed_projects = Project.where(id: view_history)
                                     .order(['field(id, ?)', view_history])

    @projects_large_amount = @projects.sort_by{ |project| project.total_support }
                                      .reverse
                                      .first(4)

    @projects_one_more_push = @projects.select{ |project| project.achievement_rate >= 40 && project.remaining_funding_days <= 30 }
                                       .sort_by{ |project| project.remaining_funding_days }
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
