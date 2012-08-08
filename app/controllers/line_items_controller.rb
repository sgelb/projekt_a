class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find_by_id(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      flash[:notice] = 'Added product to cart!'
      redirect_to @line_item.cart
    else
      flash[:error] = 'Could not add product to cart!'
      redirect_to line_items_path
    end
  end

end
