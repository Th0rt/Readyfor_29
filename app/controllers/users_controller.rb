class UsersController < ApplicationController

  def index
  end

  def show
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to edit_user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end

end
