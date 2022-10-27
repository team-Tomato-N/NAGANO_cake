class Public::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items
    else
      @genres = Genre.all
      @items = Item.all
      @cart_items = current_member.cart_items
    end
  end

  def show
    @genres = Genre.all
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
end
