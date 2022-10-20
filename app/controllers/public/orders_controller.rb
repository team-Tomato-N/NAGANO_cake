class Public::OrdersController < ApplicationController


  def new
    @order = Order.new
    @current_member = Member.find(2)
  end

  def show
  end

  def index
  end

  def create
    order = Order.new(order_params)
    # order.member_id = Member.find(2)
    order.save

  end

  def confirm
  end

  private

  def order_params
    params.require(:order).permit(:pay, :postal_code, :address, :name)
  end
end
