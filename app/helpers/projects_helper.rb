module ProjectsHelper
  def check_project_owner(project, user)
    user_signed_in? && project.owner?(user)
  end
end
