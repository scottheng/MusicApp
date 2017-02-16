class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.string :year, null: false
      t.string :genre, null: false
      t.string :category, null: false
      t.integer :band_id, null: false

      t.timestamps null: false
    end
    add_index :albums, :band_id
  end
end
