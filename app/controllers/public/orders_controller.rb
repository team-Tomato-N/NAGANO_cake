class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
  end

  def create

  end

  def confirm
    @cart_items = current_member.cart_items
    @order = Order.new(order_params)
    @order.pay = params[:order][:pay]
    @total_price = current_member.cart_items.cart_items_total_price(@cart_items)
    @order.postage = 800

    if params[:order][:address_option] == "0"
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.name = current_member.last_name + " " + current_member.first_name
      render 'confirm'
    elsif params[:order][:address_option] == "1"
      @shopping_address = ShoppingAddress.find(params[:order][:shopping_address_id])
      @order.postal_code = @shopping_address.postal_code
      @order.address = @shopping_address.address
      @order.name = @shopping_address.name
      render 'confirm'
    elsif params[:order][:address_option] == "2"
      @shopping_address = current_member.shopping_addresses.new
      @shopping_address.address = params[:order][:address]
      @shopping_address.name = params[:order][:name]
      @shopping_address.postal_code = params[:order][:postal_code]
      @shopping_address.member_id = current_member.id
      if @shopping_address.save
      @order.postal_code = @shopping_address.postal_code
      @order.name = @shopping_address.name
      @order.address = @shopping_address.address
      else
       render 'new'
      end
    end
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def index
    @orders = current_member.orders.all
  end

  private

  def order_params
    params.require(:order).permit(:pay, :postal_code, :address, :name, :postage, :amount)
  end
end
