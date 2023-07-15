class CreateOrderPieces < ActiveRecord::Migration[5.2]
  def change
    create_table :order_pieces do |t|
      t.integer :quantity
      t.string :coffee_name
      t.string :size
      t.string :ground
      t.references :order_request, foreign_key: true

      t.timestamps
    end
  end
end
