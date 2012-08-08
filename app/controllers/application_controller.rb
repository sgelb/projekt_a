class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  # decrease ingredients quantity after order is placed
  def decrease_ingredients_stock line_items
    line_items.each do |item|
      Product.find(item.product_id).ingredients.each do |ingredient|
        ingredient.update_column(:quantity, ingredient.quantity - 1)
        if ingredient.quantity == 0
          ingredient.update_column(:active, false)
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
