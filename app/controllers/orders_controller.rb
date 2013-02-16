# encoding: UTF-8
class OrdersController < ApplicationController

  before_filter :login_required, only: [ :index, :destroy ]

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
      flash[:notice] = "Bestellung wird bearbeitet"
      redirect_to store_path
    else
      flash[:error] = "Bestellung ungültig"
      render action: 'new'
    end
  end

  def destroy
    if Order.find_by_id(params[:id]).destroy
      flash[:notice] = "Bestellung geköscht ##{params[:id]}"
    else
      flash[:error] = "Bestellung ##{params[:id]} kann nicht gelöscht werden"
    end
    redirect_to orders_path
  end

end
