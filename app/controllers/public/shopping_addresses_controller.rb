class Public::ShoppingAddressesController < ApplicationController
  def index
      @shopping_addresses = ShoppingAddress.all
      @shopping_address = ShoppingAddress.new
  end

  def create
    shopping_address = ShoppingAddress.find(params[:shopping_address_id])
    #shopping_address.member_id = Member.find(2).id
    shopping_address.save
    redirect_to shopping_addresses_path
  end

  def destroy
    ShoppingAddress.find(params[:id]).destroy
    redirect_to shopping_addresses_path
  end

  def edit
  end


  private
  def shopping_address_params
    params.require(:shopping_address).permit(:postal_code, :address, :name)
  end

end
