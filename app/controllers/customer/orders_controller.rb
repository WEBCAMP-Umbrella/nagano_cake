class Customer::OrdersController < ApplicationController

##注文履歴一覧画面を表示する。
  def index
    @orders = Order.all
    @order = Order.find(params[:id])
  end

##注文情報入力画面を表示する。
  def new
    @customer = Customer.find(params[:id])
    @order =Order.new
  end

##注文履歴詳細画面を表示する。
  def show
    @order = Order.find(params[:id])
  end

##購入確定ボタンで、注文情報を確定する。
  def create
    @order =Order.new(order_params)
    if @order.save
      redirect_to thanks_customer_orders_path(@order)
    else
      @customer = current_customer
      @cart_items = Cart_item.all
      render :new
    end
  end

  ##入力された注文情報を確認画面へ渡し、表示する。
  def confirm
   @customer = Customer.find(params[:id])
   if @customer.update(customer_params)
      redirect_to customer_orders_path(@customer)
   end
  end

##購入後画面表示。
  def thanks
  end

  private
  def order_params
    　params.require(:order).permit(:customer, :quantity, :order_status)
  end
  def customer_params
    　params.require(:order).permit(:payment, :delivery, :delivery_address, :addressee)
  end

end
