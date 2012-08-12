class IngredientsLineItems < ActiveRecord::Migration
  def up
    create_table :ingredients_line_items, id: false do |t|
      t.integer :ingredient_id
      t.integer :line_item_id
  end

  def down
    drop_table :ingredients_line_items
  end
end
