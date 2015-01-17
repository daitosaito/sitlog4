class AddDetailsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :restaurant_id, :string
    add_column :categories, :tag_id, :string
  end
end
