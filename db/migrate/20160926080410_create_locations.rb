class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.integer :event_id
      t.timestamps
    end
    add_index :locations , :event_id
  end
end
