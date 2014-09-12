class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :device_id, limit: 36, null: false
      t.string :pin, limit: 4, null: false

      t.timestamps null: false
    end
    add_index :pins, :device_id, unique: true
    add_index :pins, :pin, unique: true
  end
end
