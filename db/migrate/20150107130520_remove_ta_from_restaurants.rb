class RemoveTaFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :tag_children, :text
  end
end
