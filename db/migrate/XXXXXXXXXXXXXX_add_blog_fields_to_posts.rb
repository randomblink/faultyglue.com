# frozen_string_literal: true

class AddBlogFieldsToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :title, :string
    add_column :posts, :slug, :string
    add_column :posts, :status, :string, default: "draft", null: false
    add_column :posts, :excerpt, :text
    add_column :posts, :published_at, :datetime

    add_index :posts, :slug, unique: true
    add_index :posts, :status
    add_index :posts, :published_at
  end
end
