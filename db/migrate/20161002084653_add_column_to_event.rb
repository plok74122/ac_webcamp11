class AddColumnToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :first_name, :string
    add_column :events, :last_name, :string
  end
end
