class CreateRestaurantsTags < ActiveRecord::Migration
  def change
     create_table :restautants_tags, :id => false do |t|
       t.references :tag
       t.references :restaurant

    end
  end
end
