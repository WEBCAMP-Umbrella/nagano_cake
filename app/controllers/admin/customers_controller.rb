class Admin::CustomersController < ApplicationController
  def index
  	@customers = Customer.page(params[:page]).per(10).reverse_order
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
  		redirect_to admin_customer_path(@customer)
  	else
  		render action: :edit
    end
  end

  private

    def customer_params
    	params.require(:customer).permit(:first_name, :family_name, :first_name_kana, :family_name_kana, :phone_number, :email, :is_cancel, :address, :postal_code)
    end
end
