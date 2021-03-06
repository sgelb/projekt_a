# encoding: UTF-8
class CartsController < ApplicationController

  def show
    # a user can only see his own cart
    if session[:cart_id] == params[:id].to_i
      # we get params from items_controller for create
      @cart = Cart.find(params[:id])
    else
      # either this cart does not exist. or we lie and we found a cart,
      # but it's not this user's.
      flash[:error] = 'Bestellung nicht gefunden'
      redirect_to store_url
    end
  end

  def destroy
    current_cart.line_items.each do |item|
      item.destroy
    end
    flash[:success] = 'Bestellung entfernt'
    redirect_to store_url
  end

end
