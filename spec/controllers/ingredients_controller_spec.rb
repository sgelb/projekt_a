require 'spec_helper'

describe IngredientsController do

  describe 'delete ingredient' do

    it "succeeds if ingredient is not part of product" do
      current_ingredient = FactoryGirl.create(:ingredient)
      expect {
        delete :destroy, id: current_ingredient.id
      }.to change(Ingredient, :count).by(-1)
    end

    it "fails if ingredient is part of product" do
      current_ingredient = FactoryGirl.create(:ingredient)
      FactoryGirl.create(:product).ingredients << current_ingredient
      delete :destroy, id: current_ingredient.id
      response.should_not be_successful
    end

    it "redirects to ingredients_path" do
      current_ingredient = FactoryGirl.create(:ingredient)
      delete :destroy, id: current_ingredient.id
      response.should redirect_to ingredients_path
    end

  end

end
