class AddPictureUrlToProduct < ActiveRecord::Migration
  def up
    add_column :products, :pic_url, :string
  end

  def down
    remove_column :products, :pic_url
  end

end
