# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do |n|
  name = Faker::Lorem.word
  email = Faker::Internet.email
  provider = Faker::Lorem.word
  uid = Faker::Number.between(1, 1000 )
  password = "password"
  image_url= Faker::Avatar.image
  avatar = Faker::Avatar.image
  User.create!(email: email,
               password: password,
               password_confirmation: password,
               provider: provider,
               uid: uid,
               image_url: image_url,
               avatar: avatar,
               name: name
               )
end

10.times do |n|
  content = Faker::Lorem.word
  Topic.create!(
          user_id: User.first.id,
          content: content
               )
end
