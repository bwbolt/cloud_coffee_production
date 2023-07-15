class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.integer :batches
      t.float :batch_size_kg
      t.references :lot, foreign_key: true

      t.timestamps
    end
  end
end
