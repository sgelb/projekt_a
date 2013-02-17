class AddActiveToProduct < ActiveRecord::Migration
  def up
    add_column :products, :active, :boolean
  end

  def down
    remove_column :products, :active
  end
end
