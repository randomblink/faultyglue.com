# /Volumes/Storage/Projects/faultyglue.com/db/migrate/20260118170927_add_blog_fields_to_posts.rb
# frozen_string_literal: true

class AddBlogFieldsToPosts < ActiveRecord::Migration[8.1]
  def change
    add_column :posts, :title, :string unless column_exists?(:posts, :title)
    add_column :posts, :slug, :string unless column_exists?(:posts, :slug)

    unless column_exists?(:posts, :status)
      add_column :posts, :status, :string, default: "draft", null: false
    end

    add_column :posts, :excerpt, :text unless column_exists?(:posts, :excerpt)
    add_column :posts, :published_at, :datetime unless column_exists?(:posts, :published_at)

    # Ensure slug index is UNIQUE.
    # If a non-unique index already exists with the same name, remove it first.
    if index_name_exists?(:posts, "index_posts_on_slug")
      remove_index :posts, name: "index_posts_on_slug"
    end
    add_index :posts, :slug, unique: true

    add_index :posts, :status unless index_exists?(:posts, :status)
    add_index :posts, :published_at unless index_exists?(:posts, :published_at)
  end
end
