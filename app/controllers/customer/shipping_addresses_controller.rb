class Customer::ShippingAddressesController < ApplicationController
  def index
    @shipping_addresses = Shipping_address.all
  end

  def create
    @shipping_addresse.new
    if @shipping_addresse.save
       flash[:notice] = "配送先情報を追加しました"
       redirect_to customer_shipping_addresses
    else
       @shipping_addresses = Shipping_address.all
       render :index
    end
  end

  def edit
    @shipping_addresse = Shipping_address.find_by(id: params[:id])
  end

  def update
    if @shipping_addresse.update(shipping_addresse_params)
      flash[:notice] = "配送先情報を編集しました"
      redirect_to customer_shipping_addresses
    else
      render :edit
  end

  def destroy
    @shipping_addresse = Shipping_address.find_by(id: params[:id])
    @shipping_addresse.destroy
    flash[:notice] = "配送先情報を削除しました"
    redirect_to customer_shipping_addresses
  end

  private
  def shipping_addresses
    params.require(:shipping_addresse).permit(:addressee,:postal_code,:address,:is_main_address,:customer)
  end
end