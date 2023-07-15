class CreateBlends < ActiveRecord::Migration[5.2]
  def change
    create_table :blends do |t|
      t.string :name
      t.string :notes
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
