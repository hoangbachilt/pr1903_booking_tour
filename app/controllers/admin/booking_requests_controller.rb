class Admin::BookingRequestsController < ApplicationController
  before_action :require_admin
  before_action :set_booking_request, only: [:show, :edit, :update, :destroy]

  def index
    @booking_requests = BookingRequest.page(params[:page]).order(created_at: :desc)
  end

  def new
  end

  def show
  end

  def update
    if @booking_request.update_attributes(:status => true)
      flash[:success] = "Booking request successfully update"
      redirect_to admin_booking_requests_path
    else
      flash[:danger] = "Error"
      redirect_to admin_booking_requests_path
    end
  end

  def destroy
    respond_to do |format|
      if @booking_request.destroy
        format.html { redirect_to admin_booking_requests_path, notice: 'Booking request was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end
  
  private
  def set_booking_request
    @booking_request = BookingRequest.find(params[:id])
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end
end
