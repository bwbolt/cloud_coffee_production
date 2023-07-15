class AddPricePerToLots < ActiveRecord::Migration[5.2]
  def change
    add_column :lots, :price_per, :float
  end
end
