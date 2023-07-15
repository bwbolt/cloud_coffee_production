class AddInvoiceNumberToOrderRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :order_requests, :invoice_number, :string
  end
end
