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
  end

end
