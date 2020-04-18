class Customer::ItemsController < ApplicationController
  def index
  	@items = Item.all
    @genres = Genre.all
  end

  def search
    @items = Item.where('genre LIKE ?', "%#{params[:genre]}%")
    @genre = Item.group(:genre).pluck(:genre).sort
    render :index
  end

  def show
  	@item = Item.find(params[:id])
    @genres = Genre.where(is_valid: '1')
    @cart_item = CartItem.new
  end

private
  def items_params
	params.require(:items).permit(:name,:description,:non_taxed_price,:image,:sale_status,:genre)
  end

end