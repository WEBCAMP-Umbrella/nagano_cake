class Admin::OrderItemsController < ApplicationController
  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    if @order_item.making_status == '制作中'
      @order_item.order.order_status = '制作中'
      @order_item.order.save
    end
    making_status_all = 0
    @order_item.order.order_items.each do |oi|
      if oi.making_status != '制作完了'
        making_status_all += 1
      end
    end
    if making_status_all == 0
      @order_item.order.order_status = '発送準備中'
      @order_item.order.save
    end
    redirect_to admin_order_path(@order_item.order_id)
  end

  private
    def order_item_params
      params.require(:order_item).permit(:making_status)
    end
end
