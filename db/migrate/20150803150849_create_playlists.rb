class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.timestamps null: false
      t.string :songs, array: true, default: []
      t.references :user, index: true, foreign_key: true
    end
  end
end
