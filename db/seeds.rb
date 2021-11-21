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

ueda = User.new(
  name: "ueda",
  email: "bar@google.com",
  password: "foobarfoobar",
  profile: "I am a dentist",
  url: "https://github.com/dentist"
)
ueda.save

sugawara = User.new(
  name: "sugawara",
  email: "sinnet6530@yahoo.co.jp",
  password: "foobarfoobar",
  profile: "I am a developer.",
  url: "https://github.com/developer"
)
sugawara.save

users = [tanaka, yamada, ueda, sugawara]
users.each do |user|
  40.times do
    content = Faker::Lorem.sentence(word_count: 3)
    user.microposts.create!(content: content)
  end  
end