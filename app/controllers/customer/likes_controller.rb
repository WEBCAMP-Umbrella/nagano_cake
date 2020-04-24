class Customer::LikesController < ApplicationController
   def create
    @item = Item.find(params[:item_id])
    like = Like.create(customer_id: current_customer.id, item_id: params[:item_id])
  end

  def destroy
    @item = Item.find(params[:item_id])
    like = Like.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    like.destroy
  end
end
