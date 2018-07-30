class UsersController < ApplicationController
  before_action :require_login

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
    flash[:notice] = 'プロフィール情報を更新しました。'
  end

  def profile
  end

  def month
    @returns = current_user.user_returns.where(created_at: Time.current.all_month).order('created_at DESC')
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :avatar, :profile, :password, :password_confirmation)
  end

end
