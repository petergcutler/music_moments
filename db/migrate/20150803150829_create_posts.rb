class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.timestamps null: false
      t.string :song_url
      t.string :moment
      t.string :tags, array: true, default: []
      t.integer :ups
      t.references :user, index: true, foreign_key: true
    end
  end
end
