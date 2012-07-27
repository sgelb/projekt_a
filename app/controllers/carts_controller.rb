class CartsController < ApplicationController

  def index
  end

  def new
  end

  def show
    # a user can only see his own cart
    if session[:cart_id] == params[:id].to_i
      # we get params from items_controller for create
      @cart = Cart.find(params[:id])
    else
      # either this cart does not exist. or we lie and we found a cart,
      # but it's not this user's.
      flash[:error] = 'Cart not found'
      redirect_to store_url
    end
  end

  def edit
  end

  def destroy
    # session[:cart_id] is id of current cart
    # params[:id] is product_id
    LineItem.find_by_cart_id_and_product_id(session[:cart_id], params[:id]).delete
    flash[:notice] = "Removed item from cart"
    redirect_to current_cart
  end

end
