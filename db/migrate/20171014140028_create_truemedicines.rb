class CreateTruemedicines < ActiveRecord::Migration[5.0]
  def change
    create_table :truemedicines do |t|
      t.string :codenumber
      t.string :country_of_sale
      t.date :expiration_date
      t.references :lot, foreign_key: true

      t.timestamps
    end
  end
end
