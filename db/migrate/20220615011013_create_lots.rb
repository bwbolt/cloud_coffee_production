class CreateLots < ActiveRecord::Migration[5.2]
  def change
    create_table :lots do |t|
      t.string :name
      t.string :sku
      t.string :importer
      t.string :description
      t.date :us_arrival
      t.float :price_per_lb
      t.date :sample_roasted_date
      t.float :density
      t.float :moisture
      t.string :bean_size
      t.integer :pounds_recieved
      t.integer :quantity_recieved
      t.float :current_amount
      t.string :invoice_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
