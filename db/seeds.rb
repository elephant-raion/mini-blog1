# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

yamada = User.new(
  name: "yamada",
  email: "hoge@google.com",
  password: "foobarfoobar",
  profile: "I work for my life.",
  url: "https://github.com/hogehoge"
)
yamada.save

tanaka = User.new(
  name: "tanaka",
  email: "foo@google.com",
  password: "foobarfoobar",
  profile: "I am a musician",
  url: "https://github.com/foofoo"
)
tanaka.save

users = [tanaka, yamada]
users.each do |user|
  50.times do
    content = Faker::Lorem.sentence(word_count: 3)
    user.microposts.create!(content: content)
  end  
end