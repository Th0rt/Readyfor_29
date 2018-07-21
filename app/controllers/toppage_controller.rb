class ToppageController < ApplicationController
  before_action :set_projects_all,
                :set_projects_nortable,
                :set_projects_large_amount,
                :set_projects_new
                :set_tags_all

  def index
    # NOTE: 各欄ごとにクエリを発行したくないので、allで一括取得して加工する。
    @projects = Project.where('limit_date >= ?', Time.current)

    view_history = cookie_find_or_create("project_view_history")
    @recent_viewed_projects = @projects.select{ |project| view_history.include?(project.id)}


    @projects_one_more_push = @projects.select{ |project| project.achievement_rate >= 40 && project.remaining_time[:day] <= 30 }
                                       .sort_by{ |project| project.remaining_time }
                                       .first(4)
    @tags = Tag.all
  end

  def socialgood
    @tags = Tag.all
  end

  def local
    @tags = Tag.all
  end

  def product
    @tags = Tag.all
  end

  def art
    @tags = Tag.all
  end

  def challenge
    @tags = Tag.all
  end

  private

  def set_projects_all
    @projects = Project.where('limit_date >= ?', Time.current)
  end

  def set_projects_new
    # NOTE: 全プロジェクトを渡しているのがパフォーマンス的に良くないと思うので、あとで修正したい。
    @projects_new = @projects.sort_by{ |project| project.created_at }
                             .reverse
  end

  def set_projects_nortable
    @projects_nortable = @projects.first(4)
  end

  def set_projects_large_amount
    @projects_large_amount = @projects.sort_by{ |project| project.total_support }
                                      .reverse
                                      .first(4)
  end
end
