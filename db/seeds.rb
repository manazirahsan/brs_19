# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do
  Category.create name: Faker::Lorem.word
end

100.times do
  Book.create title: Faker::Lorem.word,
    author: Faker::Name.name,
    publish_date: Faker::Date.backward(7300),
    num_of_pages: Faker::Number.number(3),
    category_id: 1+Random.rand(10)
end
