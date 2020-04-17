class Customer::HomeController < ApplicationController
  def index
  	 @genres = Genre.all
  	 @item = Item.page(params[:page]).per(4)
  end
end