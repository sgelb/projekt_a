class AddIngredientsProductsJoinTable < ActiveRecord::Migration
  def up
    create_table :ingredients_products, id: false do |t|
      t.integer :ingredient_id
      t.integer :product_id
    end
  end

  def down
    drop_table :ingredients_products
  end
end
