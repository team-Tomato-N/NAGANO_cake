class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    item = CartItem.find_by(item_id: params[:cart_item][:item_id], member_id: current_member.id)
    if  item
      item.update(quantity: item.quantity.to_i + params[:cart_item][:quantity].to_i)
    else
      cart_item = CartItem.new(cart_item_params)
      cart_item.member_id = current_member.id
      cart_item.save
    end
    redirect_to cart_items_path
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_items = current_member.cart_items
    cart_items.destroy_all

    redirect_to items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
