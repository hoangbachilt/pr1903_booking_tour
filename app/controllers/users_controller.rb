class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    
  end

  def new
    @user = User.new
  end

  def edit
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Successfully create"
    else
      flash[:danger] = "Error"
      render "new"
    end
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Update profile successfully"
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
  end
end
