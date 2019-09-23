class BookingRequestsController < ApplicationController
  before_action :logged_in_user,  only: [ :show]

  def show
    @booking_request = BookingRequest.find(params[:id])
  end

  private
  def logged_in_user
    unless logged_in?
      respond_to do |format|
      format.html { redirect_to login_url, alert: 'Please log in.' }
    end
  end
end
