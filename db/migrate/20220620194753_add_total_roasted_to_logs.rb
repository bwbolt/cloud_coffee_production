class AddTotalRoastedToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :total_roasted, :float
  end
end
