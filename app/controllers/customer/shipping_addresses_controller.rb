class Customer::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    if @shipping_address.save
       flash[:notice] = "配送先情報を追加しました"
       redirect_to customer_shipping_addresses_path
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
      redirect_to customer_shipping_addresses_path
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find_by(id: params[:id])
    @shipping_address.destroy
    flash[:notice] = "配送先情報を削除しました"
    redirect_to customer_shipping_addresses_path
  end

  private
  def shipping_address_params
    params.require(:shipping_address).permit(:addressee,:postal_code,:address,:is_main_address,:customer_id)
  end
end