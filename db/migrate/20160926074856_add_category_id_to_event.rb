class AddCategoryIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events , :category_id , :integer
    add_index :events , :category_id
  end
end
