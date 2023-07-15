class AddPccIdToLots < ActiveRecord::Migration[5.2]
  def change
    add_column :lots, :pcc_id, :string
  end
end
