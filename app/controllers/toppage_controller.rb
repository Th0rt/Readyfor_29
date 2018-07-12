class ToppageController < ApplicationController
  def index
    @recent_watched_projects = Project.where(id: JSON.parse(cookies[:recent_watched_projects]))
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
