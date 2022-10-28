class Admin::HomesController < ApplicationController
  def top
    @params = params[:id]
    @order = Order.where(member_id: @params)
    @orders = Order.all
  end
end
