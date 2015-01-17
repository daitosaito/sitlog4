class AddTagsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :tags, :text
  end
end
