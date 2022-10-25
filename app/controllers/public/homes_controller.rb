class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @items = Item.all
    @random = Item.order("RANDOM()").limit(4)
  end

  def about
  end
end
