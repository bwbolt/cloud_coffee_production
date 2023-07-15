class AddItemSizeToLots < ActiveRecord::Migration[5.2]
  def change
    add_column :lots, :item_size, :string
  end
end
