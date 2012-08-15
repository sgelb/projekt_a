class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  # decrease ingredients quantity after order is placed
  def decrease_ingredients_stock line_items
    line_items.each do |item|
      @ingredient_list = item.ingredients + 
        Product.find(item.product_id).ingredients
    end
    @ingredient_list.each do |ingredient|
      ingredient.update_column(:quantity, ingredient.quantity - 1)
      if ingredient.quantity == 0
        ingredient.update_column(:active, 0)
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
