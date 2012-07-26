class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  # return the cart object corresponding to the
  # current session. create if neccessary.
  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

end
