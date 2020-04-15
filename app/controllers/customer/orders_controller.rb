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
      redirect_to thanks_customer_orders_path
    else
      @cart_items = Cart_item.all
      render :new
    end
  end

  ##入力された注文情報を確認画面へ渡し、表示する。
  def confirm
    @order = order.new(order_params)
    render :new if @order.invalid?
  end

##購入後画面表示。
  def thanks
  end

  private
  def order_params
    　params.require(:order).permit(shipping_address_attributes:[:id, :addressee, :postal_code, :address])
  end

end
