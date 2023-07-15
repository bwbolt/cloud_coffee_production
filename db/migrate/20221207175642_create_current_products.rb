class CreateCurrentProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :current_products do |t|
      t.string :name
      t.text :details
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
