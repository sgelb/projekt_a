module ApplicationHelper
  
  # true if amount < 10
  def small_amount? quantity, threshold
    return false unless quantity <= threshold
    true
  end

  # false if product has inactive ingredients
  def has_only_active_ingredients? product
    product.ingredients.each do |i|
      if not i.active 
        return false
      end
    end
    true
  end

  # return total price
  def total_price line_items
    total = 0
    line_items.each do |item|
      total += item.product.price
    end
    total
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

  # create full title
  def full_title(page_title)
    base = "Hin & Veg"
    if page_title.empty?
      base
    else
      "#{base} | #{page_title}"
    end
  end
end
