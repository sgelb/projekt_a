class ProductsController < ApplicationController
  before_filter :login_required

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = 'gespeichert'
      redirect_to products_path
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
    @product = Product.find(params[:id])
  end

  def update
    params[:product][:ingredient_ids] ||= []
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = 'gespeichert'
      redirect_to products_path
    else
      render action: 'edit'
    end
  end


end
