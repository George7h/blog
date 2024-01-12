FactoryBot.define do
  factory :post do
    title { 'Sample title' }
    text { 'Some sample text' }
    association :author, factory: :user
    comments_count { 0 }
    likes_count { 0 }
  end
end
