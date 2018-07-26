class UsersController < ApplicationController
  before_action :require_login

  def index
  end

  def create
    User.create(user_params)
    redirect_to edit_user_path(current_user)
  end

  def show
  end

  def edit
  end

  def update
    current_user.update(user_params)
    redirect_to edit_user_path(current_user)
  end

  def profile
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :avatar, :profile)
  end

end
