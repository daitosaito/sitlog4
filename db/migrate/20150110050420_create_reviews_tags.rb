class CreateReviewsTags < ActiveRecord::Migration
 def change
   create_table :reviews_tags, :id => false do |t|
     t.references :tag
     t.references :review
   end
 end
end
