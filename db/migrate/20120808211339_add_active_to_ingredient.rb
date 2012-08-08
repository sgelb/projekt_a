class AddActiveToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :active, :boolean
  end
end
