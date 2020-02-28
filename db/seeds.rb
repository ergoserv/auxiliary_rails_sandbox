# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  Publisher.create!(
    name: Faker::Name.name
  )
end

10.times do
  author = Author.create!(
    name: Faker::Name.name
  )

  10.times do
    book = Book.create!(
      publisher: Publisher.all.sample,
      title: Faker::Book.title,
      isbn: Faker::Code.isbn,
      publishing_year: Faker::Number.between(1700,2020)
    )
    book.authors << author
  end
end

puts 'Seed finished'
puts "#{Publisher.count} lists created"
puts "#{Author.count} items created"
puts "#{Book.count} items created"
