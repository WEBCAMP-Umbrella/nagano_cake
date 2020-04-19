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
    @order = Order.new
    @order.save
    redirect_to thanks_customer_orders_path
  end

  ##入力された注文情報を確認画面へ渡し、表示する。
  def confirm
    @order = Order.new
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.payment = params[:payment]
    if params[:shipping] == '2'
      @order.delivery_address = params[:new_shipping_address]
      @order.delivery_postcode = params[:new_shipping_postcode]
      @order.addressee = params[:new_addressee]
    elsif params[:shipping] == '1'
      @other_address = current_customer.shipping_addresses.find(params[:exist_address][:address_id])
      @order.delivery_address = @other_address.address
      @order.delivery_postcode = @other_address.postal_code
      @order.addressee = @other_address.addressee
    else
      @order.delivery_address = current_customer.address
      @order.delivery_postcode = current_customer.postal_code
      @order.addressee = current_customer.family_name + current_customer.first_name
    end
          # render :new if @order.invaliid?
  end

##購入後画面表示。
  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:payment,:delivery_address, shipping_address_attributes:[:id, :addressee, :postal_code, :address])
  end

end
