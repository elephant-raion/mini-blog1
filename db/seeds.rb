# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sugawara = User.create!(
  name: "sugawara",
  email: "sinnet6530@yahoo.co.jp",
  password: "password",
  profile: "I am a developer.",
  url: "https://github.com/developer",
  created_at: 2.days.ago,
  updated_at: 2.days.ago
)
5.times do
  content = Faker::Lorem.sentence(word_count: 3)
  sugawara.microposts.create!(content: content, created_at: 1.day.ago, updated_at: 1.day.ago)
end  

19.times do |n|
  name = Faker::Name.first_name
  email = "example-#{n + 1}@example.com"
  password = "password"
  profile = Faker::Lorem.sentence(word_count: 3)
  url = "https://github.com/example-#{n + 1}"
  user = User.create!(
    name: name,
    email: email,
    password: password,
    profile: profile,
    url: url,
    created_at: 2.days.ago,
    updated_at: 2.days.ago
  )
  5.times do
    content = Faker::Lorem.sentence(word_count: 3)
    user.microposts.create!(content: content, created_at: 1.day.ago, updated_at: 1.day.ago)
  end
end

15.times do |n|
  micropost = Micropost.find(n + 1)
  (n + 1).times do |m|
    user = User.find(m + 1)
    Liking.create!(micropost_id: micropost.id, user_id: user.id, created_at: 1.day.ago, updated_at: 1.day.ago)
  end
end
