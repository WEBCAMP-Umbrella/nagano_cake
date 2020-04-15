class Customer::CustomersController < ApplicationController
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
    if @customer.update
       redirect_to root_path
    end

end