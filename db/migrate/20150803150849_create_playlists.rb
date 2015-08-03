class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.string :name
      t.created_at :datetime
      t.string :songs, array: true, default: []
      t.references :user, index: true, foreign_key: true
    end
  end
end
