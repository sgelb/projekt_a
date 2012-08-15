class ExtraIngredientsController < ApplicationController

  def add
    @product = Product.find_by_id(params[:id])

    # user can only choose from ingredients that are not
    # already on the pizza
    # TODO: re-factor
    @ingredients = Array.new
    Ingredient.all.each do |ingredient|
      if not ingredient.products.find_by_id(params[:id]) and ingredient.active?
        @ingredients << ingredient
      end
    end

  end

  def create
    @cart = current_cart
    @product = Product.find_by_id(params[:product_id])
    @line_item = @cart.line_items.build(product: @product)

    @extra_ingredients = params[:ingredient_ids] ||= []
    @extra_ingredients.each do |item|
      @line_item.ingredients << Ingredient.find_by_id(item)
    end

    if @line_item.save
      flash[:success] = 'Added product w/ extra ingredients to cart!'
    else
      flash[:error] = 'Could not add product w/ extra ingredients to cart!'
    end
    redirect_to store_url
  end

  def destroy
  end

end
