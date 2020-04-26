class Customer::HomeController < ApplicationController
  def index
  	 @genres = Genre.where(is_valid: '1')
  	 @items = Item.find(OrderItem.group(:item_id).order('count(item_id) desc').limit(5).pluck(:item_id))
  end
end