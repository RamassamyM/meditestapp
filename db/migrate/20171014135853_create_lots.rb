class CreateLots < ActiveRecord::Migration[5.0]
  def change
    create_table :lots do |t|
      t.string :lot_number
      t.string :picture_url
      t.text :rcp_description
      t.string :laboratory

      t.timestamps
    end
  end
end
