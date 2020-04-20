class Customer::ItemsController < ApplicationController
  def index
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(10).reverse_order
      @genres = Genre.where(is_valid: '1')
    else
      @items = Item.page(params[:page]).per(10).reverse_order
      @genres = Genre.where(is_valid: '1')
    end
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

