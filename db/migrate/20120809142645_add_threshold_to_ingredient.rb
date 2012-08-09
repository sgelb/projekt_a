class AddThresholdToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :threshold, :integer
  end
end
