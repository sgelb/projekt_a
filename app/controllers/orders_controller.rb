class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    current_cart.line_items.each do |item|
      # prevents item to be destroyed with the cart
      item.cart_id = nil
      @order.line_items << item
      # FIXME: check for sufficient ingredients
    end
    if @order.save
      Cart.destroy(session[:cart_id])
      decrease_ingredients_stock @order.line_items
      session[:cart_id] = nil
      flash[:notice] = "Thank you for your order"
      redirect_to store_path
    else
      flash[:error] = "Could not place order."
      render action: 'new'
    end
  end

  def destroy
    if Order.find_by_id(params[:id]).destroy
      flash[:notice] = "Deleted order ##{params[:id]}"
    else
      flash[:error] = "Could not delete order ##{params[:id]}"
    end
    redirect_to orders_path
  end

end
