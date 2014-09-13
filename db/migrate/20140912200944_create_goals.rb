class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.references :couple, index: true, null: false
      t.integer :distance, null: false
      t.integer :frequency, null: false
      t.string :prize, null: false
      t.boolean :mosaic_flg, default: false, null: true

      t.timestamps null: true
    end
  end
end
