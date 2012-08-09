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
 

  def destroy
    # session[:cart_id] is id of current cart
    # params[:id] is product_id
    LineItem.find_by_cart_id_and_product_id(session[:cart_id], params[:id]).destroy
    flash[:notice] = "Removed item from cart"
    redirect_to current_cart
  end

end
