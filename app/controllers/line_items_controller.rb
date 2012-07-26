class LineItemsController < ApplicationController

  def index
    @line_items = LineItem.all
  end

  def create
    @cart = current_cart
    product = Product.find_by_id(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      flash[:notice] = 'Added product to cart!'
    else
      flash[:error] = 'Could not add product to cart!'
    end
    redirect_to line_items_path
  end

  def edit
  end

  def destroy
    @line_item = LineItem.find_by_id(params[:id])
    @line_item.destroy
    redirect_to line_items_path
  end
    
end
