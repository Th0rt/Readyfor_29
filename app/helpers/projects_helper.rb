module ProjectsHelper
    def add_return(user, project)
      return true  if user.id == project.user_id && project.returns.length <= 3
    end
end
