class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :couple, index: true, null: false
      t.integer :distance, null: false
      t.datetime :starts_at, null: false
      t.datetime :ends_at

      t.timestamps null: false
    end
  end
end
