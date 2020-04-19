class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @total = 0
  end

  def create
    if CartItem.exists?(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
      @cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: params[:cart_item][:item_id])
      @cart_item.quantity += params[:cart_item][:quantity].to_i
    else
      @cart_item = CartItem.new(cart_item_params)
    end
    @cart_item.save
    flash[:notice] = "カートに商品を追加しました"
    redirect_to customer_cart_items_path
  end

  def update
    @cart_item = CartItem.find_by(id: params[:id])
    if @cart_item.update(cart_item_params)
       flash[:notice] = "個数を変更しました"
       redirect_to customer_cart_items_path
    else
       render :edit
    end
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.destroy
    flash[:notice] = "カートの商品を削除しました"
    redirect_to customer_cart_items_path
  end

  def cart_destroy
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @cart_items.each do |d|
      d.destroy
    end
    flash[:notice] = "カートの商品を全て削除しました"
    redirect_to customer_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :customer_id, :item_id)
  end
end
