class Customer::LikesController < ApplicationController
 def create
    @item = Item.find(params[:item_id])
    like = @item.likes.new(customer_id: current_customer.id)
    like.save
    redirect_to request.referer
  end

  def destroy
    @item = Item.find(params[:item_id])
    like = current_customer.likes.find_by(item_id: @item.id)
    like.destroy
    redirect_to request.referer
  end
end
