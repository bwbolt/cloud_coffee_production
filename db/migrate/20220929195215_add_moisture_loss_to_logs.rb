class AddMoistureLossToLogs < ActiveRecord::Migration[5.2]
  def change
    add_column :logs, :moisture_loss, :float
  end
end
