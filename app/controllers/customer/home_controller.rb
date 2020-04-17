class Customer::HomeController < ApplicationController
  def index
  	 @genres = Genre.all
  	 @items = Item.all
  end
end