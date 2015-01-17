class RemoveDetailsFromCategories < ActiveRecord::Migration
  def change
    remove_column :categories, :restaurant_id, :string
    remove_column :categories, :tag_id, :string
  end
end
