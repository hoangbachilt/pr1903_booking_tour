class ToursController < ApplicationController
  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = @tour.comments.paginate(page: params[:page])
  end

end
