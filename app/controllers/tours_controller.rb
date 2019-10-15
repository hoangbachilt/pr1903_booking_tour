class ToursController < ApplicationController

  def index
    @tours = Tour.search(params[:name], params[:page])
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = @tour.comments.root_comments
    @booking_request = @tour.booking_requests.find_by(user_id: current_user.try(:id))
    @comment = @tour.comments.build( user_id: current_user.try(:id))
  end
  
  private
  def tour_params
    params.require(:tour).permit(:name, :price, :content)
  end

  def logged_in_user
    unless logged_in?
      respond_to do |format|
        format.html { redirect_to login_url, alert: 'Please log in.' }
      end
    end
  end
end
