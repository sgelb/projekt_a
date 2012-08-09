class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find_by_id(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      flash[:success] = 'Added product to cart!'
      redirect_to store_url
    else
      flash[:error] = 'Could not add product to cart!'
      redirect_to store_url
    end
  end
 

  def destroy
    # session[:cart_id] is id of current cart
    # params[:id] is product_id
    LineItem.find_by_cart_id_and_product_id(session[:cart_id], params[:id]).destroy
    flash[:success] = "Removed item from cart"
    redirect_to store_url
  end

end
