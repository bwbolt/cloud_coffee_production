class RemovePricePerLbFromLots < ActiveRecord::Migration[5.2]
  def change
    remove_column :lots, :price_per_lb
  end
end
