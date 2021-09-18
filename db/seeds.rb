# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Seeding Database...'
puts 'Creating users...'
users = FactoryBot.create_list(:user, 50)

puts 'Creating posts...'
users.each do |user|
  FactoryBot.create_list(:post, rand(1...5), author: user)
end

user_ids = users.pluck(:id)

puts 'Adding comments to posts...'
Post.all.each do |post|
  rand(1..5).times do
    author_id = user_ids[rand(0..(user_ids.size - 1))]
    author = User.find(author_id)
    FactoryBot.create(:comment, author: author, post: post)
  end
end

puts 'Done!!!'
