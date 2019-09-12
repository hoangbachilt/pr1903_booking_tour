class ToursController < ApplicationController
  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def show
    @tours = Tour.find(params[:id])
  end

end
