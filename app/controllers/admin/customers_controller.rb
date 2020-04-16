class Admin::CustomersController < ApplicationController
  def index
  	@customers = Customer.all
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	shipping_address.addressee = @customer.family_name + @customer.first_name
  	if @customer.update(customer_params)
  		redirect_to admin_customer_path(@customer)
  	else
  		render action: :edit
    end
  end

  private
  def customer_params
  	params.require(:customer).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :phone_number, :email, :is_cancel, shipping_address_attributes:[:id, :addressee, :postal_code, :address])
  end
end
