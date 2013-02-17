# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  private
  
  # check if signed in user
  def login_required
    redirect_to store_path unless signed_in?
  end

  # decrease ingredients quantity after order is placed
  def decrease_ingredients_stock line_items
    line_items.each do |item|
      (item.ingredients + Product.find(item.product_id).ingredients).each do |ingredient|
        ingredient.update_column(:quantity, ingredient.quantity - 1)
        if ingredient.quantity == 0
          ingredient.update_column(:active, 0)
        end
      end
    end
  end

  def put_ingredients_back line_items
    line_items.each do |item|
      (item.ingredients + Product.find(item.product_id).ingredients).each do |ingredient|
        ingredient.update_column(:quantity, ingredient.quantity + 1)
        if ingredient.quantity != 0
          ingredient.update_column(:active, 1)
        end
      end
    end
  end

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
