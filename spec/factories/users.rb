FactoryBot.define do
  factory :user do
    name { 'John Doe' }
    bio { 'Developer' }
    photo { 'https://images.pexels.com/photos/1792596/pexels-photo-1792596.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2' }
    postsCounter { 0 }
  end
end
