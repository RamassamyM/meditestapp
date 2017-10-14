class AddNameToLot < ActiveRecord::Migration[5.0]
  def change
    add_column :lots, :name, :string
  end
end
