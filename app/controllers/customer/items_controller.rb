class Customer::ItemsController < ApplicationController
  def index
  	@items = Item.page(params[:page]).per(10).reverse_order
    @genres = Genre.where(is_valid: '1')

  end

  def search
    @items = Item.where(genre_id: '4')
    @genres = Genre.where(is_valid: '1')
    render :index
  end

  def show
  	@item = Item.find(params[:id])
    @genres = Genre.where(is_valid: '1')
    @cart_item = CartItem.new
  end

private
  def items_params
	params.require(:items).permit(:name,:description,:non_taxed_price,:image,:sale_status,:genre_id)
  end

end

