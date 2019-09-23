class ToursController < ApplicationController
  before_action :logged_in_user,  only: [:index,  :edit,  :update]
  
  def index
    @tours = Tour.search(params[:name], params[:page])
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = @tour.comments.paginate(page: params[:page])
    @booking_request = @tour.booking_requests.find_by(user_id: current_user.id)
  end

  private
  def logged_in_user
    unless logged_in?
      respond_to do |format|
      format.html { redirect_to login_url, alert: 'Please log in.' }
    end
  end
end
