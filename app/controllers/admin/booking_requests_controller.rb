class Admin::BookingRequestsController < ApplicationController
  before_action :require_admin

  def index
    @booking_requests = BookingRequest.page(params[:page]).order(created_at: :desc)
  end

  def new
  end

  def show
    @booking_request = BookingRequest.find(params[:id])
  end

  def create
  end
  
  private
  def booking_request_params
    params.require(:booking_request).permit(:tour_id, :user_id)
  end

  def require_admin
    unless current_user.admin?
      redirect_to root_path
    end
  end

end
