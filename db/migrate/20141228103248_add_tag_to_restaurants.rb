class AddTagToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :tag, :string
  end
end
