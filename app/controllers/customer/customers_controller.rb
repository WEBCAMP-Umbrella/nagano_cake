class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  ##マイページの表示
  def show
    @customer = Customer.find(current_customer.id)
  end

##退会確認ページの表示
  def cancel
    @customer = Customer.find(current_customer.id)
  end

##退会ボタンを押す
  def destroy
  	@customer = Customer.find(current_customer.id)
    @customer.toggle!(:is_cancel)
    reset_session
    redirect_to root_path
  end

end