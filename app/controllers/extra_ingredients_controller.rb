class ExtraIngredientsController < ApplicationController

  def add
    @product = Product.find_by_id(params[:id])
    # we only want to choose from ingredients that are not
    # already on the pizza
    @ingredients = Array.new
    Ingredient.all.each do |ingredient|
      if not ingredient.products.find_by_id(params[:id])
        @ingredients << ingredient
      end
    end
  end

  def create
    # TODO
    # add to @cart.line_items.ingredients
  end

  def destroy
  end

end
