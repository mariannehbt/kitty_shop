# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts '*' * 60
puts 'Seeds'
puts '*' * 60

puts '*' * 60
puts 'Wiping database'
puts '*' * 60

puts '*' * 60
puts 'Creating 10 Users'
puts '*' * 60

10.times do
	User.create!(
		email: Faker::Name.first_name + '.' + Faker::Name.last_name + '@yopmail.com',
		password: 'coucou',
		)
end

puts '*' * 60
puts 'Creating 10 Items'
puts '*' * 60

20.times do |index|
	Item.create!(
		title: "Picture - #{index + 1}",
		description: Faker::Lorem.sentence(word_count: 10),
		price: rand(1..1000),
		image_url: "cat_card#{rand(1..12)}.jpg"
		)
end

puts '*' * 60
puts 'Creating nothing'
puts '*' * 60
