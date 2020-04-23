class Customer::HomeController < ApplicationController
  def index
  	 @genres = Genre.where(is_valid: '1')
  	 @items = Item.page(params[:page]).per(6)
  end
end