# encoding: UTF-8
class LineItemsController < ApplicationController

  def create
    @cart = current_cart
    product = Product.find_by_id(params[:product_id])
    @line_item = @cart.line_items.build(product: product)
    if @line_item.save
      decrease_ingredients_stock [@line_item]
      flash[:success] = 'Pizza hinzugefügt!'
      redirect_to store_url
    else
      flash[:error] = 'Pizza kann nicht hinzugefügt werden!'
      redirect_to store_url
    end
  end
 

  def destroy
    # session[:cart_id] is id of current cart
    # params[:id] is product_id
    line_item = LineItem.find_by_cart_id_and_product_id(session[:cart_id], params[:id])
    put_ingredients_back [line_item]
    line_item.destroy
    flash[:success] = "Von Liste entfernt"
    redirect_to store_url
  end

end
