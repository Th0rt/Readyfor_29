class ToppageController < ApplicationController
  def index
    # NOTE: 各欄ごとにクエリを発行したくないので、allで一括取得して加工する。
    @projects = Project.where('limit_date >= ?', Time.current)

    # NOTE: 全プロジェクトを渡しているのがパフォーマンス的に良くないと思うので、あとで修正したい。
    @new_project = @projects.sort_by{ |project| project.created_at }
                            .reverse

    view_history = cookie_find_or_create("project_view_history")
    @recent_viewed_projects = @projects.select{ |project| view_history.include?(project.id)}

    @projects_large_amount = @projects.sort_by{ |project| project.total_support }
                                      .reverse
                                      .first(4)

    @projects_one_more_push = @projects.select{ |project| project.achievement_rate >= 40 && project.remaining_time[:day] <= 30 }
                                       .sort_by{ |project| project.remaining_time[:day] }
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
