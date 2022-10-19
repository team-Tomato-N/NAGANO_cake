class ApplicationController < ActionController::Base

  def index
  if params[:id].present?
    @shopping_addresses = Shopping_addresses.all
    @shopping_addresses = Shopping_addresses.all
  else
    @shopping_addresses = Shopping_addresses.all
    @shopping_address= Shopping_address.new
  end

  def create
    shopping_address = Shopping_address.find(params[:shopping_address_id])
    shopping_address.save
    redirect_to shopping_addresses_path
  end

  def destroy
    Shopping_address.find(params[:id]).destroy
    redirect_to shopping_addresses_path
  end

  private
  def shopping_address_params
    params.require(:shopping_address).permit(:postal_code, address, name)
  end

end
