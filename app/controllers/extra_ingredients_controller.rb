# encoding: UTF-8
class ExtraIngredientsController < ApplicationController

  def add
    @product = Product.find_by_id(params[:id])

    # user can only choose from ingredients that are not
    # already on the pizza
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
      decrease_ingredients_stock [@line_item]
      flash[:success] = 'Pizza mit extra Zutaten hinzugefügt'
    else
      flash[:error] = 'Pizza mit extra Zutaten nicht hinzugefügt!'
    end
    redirect_to store_url
  end

  def destroy
  end

end
