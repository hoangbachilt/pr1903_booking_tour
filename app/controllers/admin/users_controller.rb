class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show ]
  def index
    @users = User.paginate(page: params[:page])
  end

  private
  def set_user
    unless current_user.admin?
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
