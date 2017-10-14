class CreateTests < ActiveRecord::Migration[5.0]
  def change
    create_table :tests do |t|
      t.string :codenumber
      t.string :country
      t.string :image_url
      t.string :test_type

      t.timestamps
    end
  end
end
