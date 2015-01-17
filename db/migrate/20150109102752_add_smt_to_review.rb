class AddSmtToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :restaurant_id, :integer
    add_column :reviews, :review, :text
  end
end
