class Customer::CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_customer, only: [:destroy]

##マイページの表示
  def show
  	@customer = Customer.find(params[:id])
  end

##退会確認ページの表示
  def cancel
  	@customer = Customer.find(params[:id])
  end

##退会ボタンを押す
  def destroy
  	@customer = Customer.find(params[:id])
    if @customer.destroy
       redirect_to root_path
    end

   def correct_customer
   	@cutomer = Customer.find(params[:id])
    redirect_to(root_url) unless @customer == current_user
   end
end

end