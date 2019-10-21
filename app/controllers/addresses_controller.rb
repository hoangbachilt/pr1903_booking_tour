class AddressesController < ApplicationController
  def index
    @addresses = Address.paginate(page: params[:page])
  end

  def show
    @address = Address.find(params[:id])
    @tours = @address.tours.paginate(page: params[:page])
  end

end
