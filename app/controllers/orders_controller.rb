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
    end
    if @order.save
      Cart.destroy(session[:cart_id])
      session[:cart_id] = nil
      flash[:notice] = "Thank you for your order"
      redirect_to store_path
    else
      flash[:error] = "Could not place order."
      render action: 'new'
    end
  end

end
