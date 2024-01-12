FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    bio { 'Developer' }
    photo { 'profile.jpg' }
    postsCounter { 0 }
  end
end
