class Public::ShoppingAddressesController < ApplicationController
  before_action :authenticate_member!

  def index
    @member = current_member
    @shopping_address = ShoppingAddress.new
    @shopping_addresses =  @member.shopping_addresses
  end

  def create
    @shopping_address = ShoppingAddress.new(shopping_address_params)
    @shopping_address.member_id = current_member.id
    @shopping_address.save
    redirect_to shopping_addresses_path
  end

  def destroy
    ShoppingAddress.find(params[:id]).destroy
    redirect_to shopping_addresses_path
  end

  def edit
    @shopping_address = ShoppingAddress.find(params[:id])
  end

  def update
    shopping_address = ShoppingAddress.find(params[:id])
    shopping_address.update(shopping_address_params)
    redirect_to shopping_addresses_path
  end

  private
  def shopping_address_params
    params.require(:shopping_address).permit(:postal_code, :address, :name)
  end

end
