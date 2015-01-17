class AddDetailsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :price, :integer
    add_column :restaurants, :review, :text
  end
end
