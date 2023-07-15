class AddIcoToLots < ActiveRecord::Migration[5.2]
  def change
    add_column :lots, :ico, :string
  end
end
