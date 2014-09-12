class CreateCouples < ActiveRecord::Migration
  def change
    create_table :couples do |t|
      t.string :husband, limit: 36, null: false
      t.string :wife, limit: 36, null: false

      t.timestamps null: false
    end
    add_index :couples, :husband, unique: true
    add_index :couples, :wife, unique: true
  end
end
