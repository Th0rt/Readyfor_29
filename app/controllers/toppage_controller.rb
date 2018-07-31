class ToppageController < ApplicationController

  def index
    # NOTE: 各欄ごとにクエリを発行したくないので、allで一括取得して加工する。
    set_section_projects(Project.all)

    view_history = cookie_find_or_create("project_view_history")
    @recent_viewed_projects = @projects.select{ |project| view_history.include?(project.id)}


    @projects_one_more_push = @projects.select{ |project| project.achievement_rate >= 40 && project.remaining_time[:day] <= 30 }
                                       .sort_by{ |project| project.remaining_time }
                                       .first(4)
  end

  def socialgood
    @category = Category.find_by(name: '社会にいいこと')
    set_section_projects(@category.projects)
    @tags = @category.tags
  end

  def local
    @category = Category.find_by(name: '地域')
    set_section_projects(@category.projects)
    @tags = @category.tags
  end

  def product
    @category = Category.find_by(name: 'ものづくり')
    set_section_projects(@category.projects)
    @tags = @category.tags
  end

  def art
    @category = Category.find_by(name: 'アート')
    set_section_projects(@category.projects)
    @tags = @category.tags
  end

  def challenge
    @category = Category.find_by(name: 'チャレンジ')
    set_section_projects(@category.projects)
    @tags = @category.tags
  end

  private

  def set_section_projects(projects)
    @projects              = projects.active
    @projects_large_amount = @projects.order_total_support.first(4)
    @projects_new          = @projects.order_new.first(4)
    @projects_nortable     = @projects.order('likes_count DESC').limit(4)
  end
end
