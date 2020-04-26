class Customer::ItemsController < ApplicationController
  def index
    if params[:genre_id].present?
      @genre = Genre.find(params[:genre_id])
      @items = @genre.items.page(params[:page]).per(9).reverse_order
      @genres = Genre.where(is_valid: '1')
    else
      @items = Item.page(params[:page]).per(9).reverse_order
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

def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    if @item.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def item_params
    params.require(:item).permit(:content)
  end
end
