class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.integer :codenumber
      t.string :country
      t.string :image_url
      t.string :image_type

      t.timestamps
    end
  end
end
