class Customer::OrdersController < ApplicationController

##注文履歴一覧画面を表示する。
  def index
    @orders = Order.all
  end

##注文情報入力画面を表示する。
  def new
    @customer = Customer.find(current_customer.id)
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
      redirect_to thanks_customer_orders_path
    else
      @cart_items = CartItem.where(customer_id: current_customer.id)
      render :new
    end
  end

  ##入力された注文情報を確認画面へ渡し、表示する。
  def confirm
    @order = Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    # render :new if @order.invaliid?
  end

##購入後画面表示。
  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:payment, shipping_address_attributes:[:id, :addressee, :postal_code, :address])
  end

end
