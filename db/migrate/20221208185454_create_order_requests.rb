class CreateOrderRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :order_requests do |t|
      t.string :employee_name
      t.string :recipient_name
      t.string :reason
      t.date :need_by_date
      t.integer :status, :default => 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
