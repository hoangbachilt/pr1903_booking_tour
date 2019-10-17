class BookingRequestsController < ApplicationController
  include SessionsHelper
  before_action :logged_in?, only: [:create]
  before_action :logged_in_user, only: [:create] 

  def index
    @booking_requests = current_user.booking_requests.page(params[:page]).order(created_at: :desc)
  end

  def new
  end

  def show
    @booking_request = BookingRequest.find(params[:id])
  end

  def create
    # if logged_in?
    @booking_request = current_user.booking_requests.new(booking_request_params)
    if @booking_request.save
      flash[:success] = "Success booking. Please waiting admin accept"
      redirect_to booking_requests_path
    else
      flash[:danger] = "Booking fail"
      redirect_to tours_path
    end
  end
  
  private
  def booking_request_params
    params.require(:booking_request).permit(:tour_id)
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to signup_url
    end
  end
end
