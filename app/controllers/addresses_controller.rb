class AddressesController < ApplicationController
  def index
    @addresses = Address.paginate(page: params[:page])
  end

  def show
    @address = Address.find(params[:id])
  end

end
