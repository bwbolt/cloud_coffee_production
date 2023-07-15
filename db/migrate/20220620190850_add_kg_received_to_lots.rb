class AddKgReceivedToLots < ActiveRecord::Migration[5.2]
  def change
    add_column :lots, :kg_received, :float
  end
end
