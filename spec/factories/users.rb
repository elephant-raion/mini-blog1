FactoryBot.define do
  factory :user do
    name { "tester" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    profile { "I'm a tester." }
    url { "https://github.com/tester" }
    password { "foobarfoobar" }
  end
end
