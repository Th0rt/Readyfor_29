class UsersController < ApplicationController

  def index
  end

  def create
    User.create(user_params)
    redirect_to edit_user_path(current_user)
  end

  def show
    @returns = current_user.user_returns.order('created_at DESC')
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
