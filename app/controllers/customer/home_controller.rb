class Customer::HomeController < ApplicationController
  def index
  	 @genres = Genre.where(is_valid: '1')
  	 @item = Item.page(params[:page]).per(4)
  end
end