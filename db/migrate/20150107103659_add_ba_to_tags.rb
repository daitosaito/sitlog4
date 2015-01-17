class AddBaToTags < ActiveRecord::Migration
  def change
    add_column :tags, :category_id, :string
  end
end
