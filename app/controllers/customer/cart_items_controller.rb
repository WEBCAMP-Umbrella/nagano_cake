class Customer::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @item = Items.find_by(id: params[:id])
    @cart_items.save
    flash[:notice] = "カートに商品を追加しました"
    redirect_to customer_cart_items_path
  end

  def update
    @cart_items = CartItem.find_by(id: params[:id])
    if @cart_items.update(cart_items_params)
       flash[:notice] = "個数を変更しました"
       redirect_to customer_cart_items_path
    else
       render :edit
    end
  end

  def destroy
    @cart_items = CartItem.find_by(id: params[:id])
    @cart_items.destroy
    flash[:notice] = "カートの商品を削除しました"
    redirect_to customer_cart_items_path
  end

  def cart_destroy
    @cart_items = CartItem.where(params[:customer_id])
    @cart_items.destroy
    flash[:notice] = "カートの商品を全て削除しました"
    redirect_to customer_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:quantity,:item,:customer)
  end
end
