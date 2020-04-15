class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  def index
    @orders = Order.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to @order
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
