FactoryBot.define do
  factory :micropost do
    sequence(:content) { |n| "test sentence #{n}."}
    association :user
  end
end
