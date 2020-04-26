class Customer::ItemsController < ApplicationController
  def index
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(12).reverse_order
      @genres = Genre.where(is_valid: '1')
    else
      @items = Item.page(params[:page]).per(12).reverse_order
      @genres = Genre.where(is_valid: '1')
    end
  end

  def show
  	@item = Item.find(params[:id])
    @genres = Genre.where(is_valid: '1')
    @cart_item = CartItem.new
    @comments = @item.comments
    @comment = Comment.new
    if customer_signed_in?
      @customer = Customer.find(current_customer.id)
    end
  end

  def search
    @item = Item.search(params[:search])
    @items = @item.page(params[:page]).per(9).reverse_order
    @genres = Genre.where(is_valid: '1')
  end

private
  def items_params
	params.require(:items).permit(:name,:description,:non_taxed_price,:image,:sale_status,:genre_id)
  end
end
