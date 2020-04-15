class Customer::ItemsController < ApplicationController
  def index
  	@items = Item.all
  end

  def show
  	@items = find_by(id: params[:id])
  end

private
  def cart_items_params
	params.require(:items).permit(:name,:description,:non_taxed_price,:image,:sale_status,:genre)
  end

end