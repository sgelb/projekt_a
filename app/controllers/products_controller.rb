class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      flash[:notice] = 'Saved new product!'
      redirect_to @product
    else
      render action: 'new'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url
  end

  def edit
  end

end
