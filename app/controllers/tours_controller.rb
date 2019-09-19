class ToursController < ApplicationController
  def index
    @tours = Tour.search(params[:name], params[:page])
  end

  def show
    @tour = Tour.find(params[:id])
    @comments = @tour.comments.paginate(page: params[:page])
  end
end
