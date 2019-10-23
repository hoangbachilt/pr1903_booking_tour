class Admin::AddressesController < ApplicationController
  before_action :require_admin
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  def index
    @addresses = Address.paginate(page: params[:page])
  end

  def show
    @tours = @address.tours.paginate(page: params[:page])
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to admin_address_path(@address)
      flash[:success] = "Successfully create"
    else
      flash[:danger] = "Error"
      render "new"
    end
  end

  def update
    if @address.update_attributes(address_params)
      flash[:success] = "Update address successfully"
      redirect_to admin_addresses_path
    else
      render "edit"
    end
  end

  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end

  def require_admin
    unless current_user.admin?
      flash[:danger] = "You are not admin"
      redirect_to root_path
    end
  end

  def address_params
    params.require(:address).permit(:city, :picture)
  end
end
