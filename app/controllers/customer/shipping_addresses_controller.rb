class Customer::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = ShippingAddress.where(params[:customer_id])
    @shipping_address.new
  end

  def create
    @shipping_address.new(shipping_addresse_params)
    if @shipping_address.save
       flash[:notice] = "配送先情報を追加しました"
       redirect_to customer_shipping_addresses
    else
       @shipping_addresses = ShippingAddress.where(params[:customer_id])
       render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find_by(id: params[:id])
  end

  def update
    if @shipping_address.update
      flash[:notice] = "配送先情報を編集しました"
      redirect_to customer_shipping_addresses
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find_by(id: params[:id])
    @shipping_address.destroy
    flash[:notice] = "配送先情報を削除しました"
    redirect_to customer_shipping_addresses
  end

  private
  def shipping_address_params
    params.require(:shipping_addresse).permit(:addressee,:postal_code,:address,:is_main_address,:customer)
  end
end