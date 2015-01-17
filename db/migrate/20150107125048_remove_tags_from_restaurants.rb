class RemoveTagsFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :tags, :text
  end
end
