class RemovePoundsRecievedFromLots < ActiveRecord::Migration[5.2]
  def change
    remove_column :lots, :pounds_recieved
  end
end
