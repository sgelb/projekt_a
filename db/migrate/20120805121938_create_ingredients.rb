class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :quantity
      t.decimal :price, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
