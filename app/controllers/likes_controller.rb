class LikesController < ApplicationController
 def create
    @like = Like.create(customer_id: current_customer.id, item_id: params[:item_id])
    @likes = Like.where(item_id: params[:item_id])
    @items = Item.all
  end

  def destroy
    like = Like.find_by(customer_id: current_customer.id, item_id: params[:item_id])
    like.destroy
    @likes = Like.where(item_id: params[:item_id])
    @items = Item.all
  end
end
