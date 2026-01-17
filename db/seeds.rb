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
  { title: "Welcome to FaultyGlue", body: "This is the start of something sticky. Welcome to the new blog!" },
  { title: "Rails Scaffolding", body: "We just scaffolded this blog using Rails generators." }
].each do |post_attrs|
  Post.find_or_create_by!(title: post_attrs[:title]) { |post| post.body = post_attrs[:body] }
end
