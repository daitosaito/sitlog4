class AddTagssToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :tag_children, :text
  end
end
