class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts, if_not_exists: true do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.datetime :published_at
      t.string :status

      t.timestamps
    end
    add_index :posts, :slug
  end
end
