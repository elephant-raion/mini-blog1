FactoryBot.define do
  factory :user do
    
    name { "tester" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    profile { "I'm a tester." }
    url { "https://github.com/tester" }
    password { "foobarfoobar" }  
    
    trait :updated do
      name { "EditTester" }
      sequence(:email) {|n| "edit.tester#{n}@example.com" }
      profile { "I'm a editor." }
      url { "http://github.com/edit_tester" }
      password { "foobarfoobareditor" }
    end
  end

end
