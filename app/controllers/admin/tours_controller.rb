class Admin::ToursController < ApplicationController
  before_action :require_admin

  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def new
    @tour = Tour.new
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      flash[:success] = "Create tour successfully"
    else
      flash[:danger] = "Create fail"
      render :new
    end
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(tour_params)
      flash[:success] = "Update tour successfully"
      redirect_to admin_address_path(@tour.address)
    else
      render "edit"
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def require_admin
    unless current_user.admin?
      flash[:danger] = "You are not admin"
      redirect_to root_path
    end
  end

  def tour_params
    params.require(:tour).permit(:name, :price, :content, :picture)
  end
end
