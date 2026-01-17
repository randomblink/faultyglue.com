# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  { title: "First Post", body: "This is the very first post on the blog." },
  { title: "Second Post", body: "Here is some content for the second post." },
  { title: "Third Post", body: "The third post is always the charm." },
  { title: "Fourth Post", body: "Just keeping the momentum going with post four." },
  { title: "Fifth Post", body: "Wrapping up the seed data with post number five." }
].each do |post_attrs|
  Post.find_or_create_by!(title: post_attrs[:title]) do |post|
    post.body = post_attrs[:body]
    post.slug = post_attrs[:title].parameterize
    post.published_at = Time.current
    post.status = "published"
  end
end
