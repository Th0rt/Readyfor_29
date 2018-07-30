module ProjectsHelper
  def check_owner(user,project)
    user_signed_in? && user.project_owner?(project)
  end
end
