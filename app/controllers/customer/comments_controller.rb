class Customer::CommentsController < ApplicationController
  before_action :authenticate_customer!, except: [:index]
  def index
    @comment = Comment.new
    @item = Item.find(params[:item_id])
  end


  def edit
  end

  def destroy
  end

def create
    @comment = Comment.new(comment_params)
    @comment.customer_id = current_customer.id
    @comment.item_id = params[:item_id]
    if @comment.save
    redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end


  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
