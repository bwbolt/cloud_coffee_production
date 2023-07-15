class CreateBlendLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blend_logs do |t|
      t.references :blend, foreign_key: true
      t.references :log, foreign_key: true

      t.timestamps
    end
  end
end
