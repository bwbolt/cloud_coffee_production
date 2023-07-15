class AddGroundToOrderPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :order_pieces, :ground, :string
  end
end
