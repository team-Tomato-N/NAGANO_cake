class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = ""
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end

  end
  def show
    @item = Item.find(params[:id])
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = ""
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :genre_id, :not_tax_price, :item_image, :is_active)
  end
end
