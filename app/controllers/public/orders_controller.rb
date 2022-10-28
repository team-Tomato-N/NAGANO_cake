class Public::OrdersController < ApplicationController
  before_action :authenticate_member!

  def new
    @cart_items = current_member.cart_items
    if @cart_items == nil
    render cart_items_path
    else
    @order = Order.new
    end
  end

  def confirm
    @cart_items = current_member.cart_items
    @order = Order.new(order_params)
    @order.pay = params[:order][:pay]
    @total_price = current_member.cart_items.cart_items_total_price(@cart_items)
    @order.postage = 800

    #[:address_option]=="0"のデータ(memberの住所)を呼び出す
    if params[:order][:address_option] == "0"
      @order.postal_code = current_member.postal_code
      @order.address = current_member.address
      @order.name = current_member.last_name + " " + current_member.first_name
      render 'confirm'
    #[:address_option]=="1"(memberの配送先)を呼び出す
    elsif params[:order][:address_option] == "1"
      @shopping_address = ShoppingAddress.find_by(params[:order][:shopping_address_id])
      @order.postal_code = @shopping_address.postal_code
      @order.address = @shopping_address.address
      @order.name = @shopping_address.name
      render 'confirm'
    #新規住所入力 [:address_option]=="2"としてデータをhtmlから受ける
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

  def create
    @order = Order.new(order_params)
    @order.member_id = current_member.id
    if @order.save!
      @cart_items = current_member.cart_items
      @cart_items.each do |cart_item|
        order_detail = OrderDetail.new(order_id: @order.id)
        order_detail.price = cart_item.item.not_tax_price
        order_detail.quantity = cart_item.quantity
        order_detail.item_id = cart_item.item_id
        order_detail.save!
      end
      @cart_items.destroy_all
      redirect_to orders_complete_path
    else
      render "new"
    end
  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def index
    @orders = current_member.orders
  end

  private

  def order_params
    params.require(:order).permit(:pay, :postal_code, :address, :name, :postage, :amount)
  end
end
