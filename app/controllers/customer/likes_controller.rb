class Customer::LikesController < ApplicationController
  before_action :authenticate_customer!

   def index
   	@likes = Like.where(customer_id: current_customer.id)
    @cart_item = CartItem.new
   end


   def create
    @item = Item.find(params[:item_id])
    like = Like.create(customer_id: current_customer.id, item_id: params[:item_id])
    route = Rails.application.routes.recognize_path(request.referer)
      if route == {:controller => "customer/likes", :action => "index"}
      redirect_to customer_likes_path(customer_id: current_customer.id)
      end
      if route == {:controller => "customer/items", :action => "index"}
      redirect_to customer_items_path
      end
  end

  def destroy
    @item = Item.find(params[:item_id])
    like = Like.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    like.destroy
    route = Rails.application.routes.recognize_path(request.referer)
  	  if route == {:controller => "customer/likes", :action => "index"}
  	  redirect_to customer_likes_path(customer_id: current_customer.id)
  	  end
      if route == {:controller => "customer/items", :action => "index"}
      redirect_to customer_items_path
    end
  end
end
