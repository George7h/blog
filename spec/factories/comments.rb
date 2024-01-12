FactoryBot.define do
  factory :comment do
    text { 'This is my first post' }
    association :user
    association :post
  end
end
