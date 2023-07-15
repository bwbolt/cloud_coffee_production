class AddWeightOutToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :weight_out, :float
  end
end
