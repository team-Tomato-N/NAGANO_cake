class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
    @cart_items = current_member.cart_items
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
