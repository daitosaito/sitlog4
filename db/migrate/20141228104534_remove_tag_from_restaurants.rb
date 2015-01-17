class RemoveTagFromRestaurants < ActiveRecord::Migration
  def change
    remove_column :restaurants, :tag, :string
  end
end
