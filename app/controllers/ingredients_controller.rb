class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      flash[:success] = 'Saved new ingredient!'
      redirect_to ingredients_path
    else
      render action: 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def destroy
    @ingredient = Ingredient.find_by_id(params[:id])
    Product.all.each do |product|
      product.ingredients.each do |ingredient|
        if ingredient.id == @ingredient.id
          flash[:error] = 'Cannot delete ingredient that is still part of product.'
          redirect_to ingredients_path
          return
        end
      end
    end
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(params[:ingredient])
      flash[:success] = 'Saved edited ingredient!'
      redirect_to ingredients_path
    else
      render action: 'edit'
    end
  end

end
