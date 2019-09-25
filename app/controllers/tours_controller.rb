class ToursController < ApplicationController
  
  def index
    @tours = Tour.search(params[:name], params[:page])
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = @tour.comments.paginate(page: params[:page])
    @booking_request = @tour.booking_requests.find_by(user_id: current_user.id)
  end

  private
  def tour_params
    params.require(:tour).permit(:name, :price, :content)
  end

end
