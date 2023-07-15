class RemoveGroundFromOrderPieces < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_pieces, :ground, :boolean
  end
end
