class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.timestamps null: false
      t.string :content
      t.references :post, index: true, foreign_key: true
    end
  end
end
