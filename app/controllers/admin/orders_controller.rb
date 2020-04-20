class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items.all
  end

  def index
    route = Rails.application.routes.recognize_path(request.referer)
    if route == {:controller => "admin/home", :action => "index"}
      range = Time.current.beginning_of_day..Time.current.end_of_day
      @date_orders = Order.where(created_at: range)
      @orders = @date_orders.page(params[:page]).per(10).reverse_order
    elsif params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @customer_orders = @customer.orders.all
      @orders = @customer_orders.page(params[:page]).per(10).reverse_order
    else
      @orders = Order.page(params[:page]).per(10).reverse_order
    end
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == '入金確認'
      @order.order_items.each do |o|
        o.making_status = '制作待ち'
        o.save
      end
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end
end
