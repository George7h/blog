# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


first_user = User.create(name: 'Tom', photo: 'https://images.pexels.com/photos/1792596/pexels-photo-1792596.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://images.pexels.com/photos/6635006/pexels-photo-6635006.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Traveling is life', text: 'Hola mis amigos! Just landed in Mexico City, ready to spice up my life with tacos and teaching! Wish me luck, amigos!')
second_post = Post.create(author: first_user, title: 'Elote Epiphany: Toms Tastebuds Do the Macarena', text: 'Sweet corn on the cob? More like an edible fiesta! My tastebuds are doing the Macarena.')
third_post = Post.create(author: first_user, title: 'Pyramids & Puns: Toms Teotihuacan Adventure', text: 'Pyramids, ancient vibes, and enough cactus jokes to fill a sombrero. Feeling humbled and hilarious.')
fourth_post = Post.create(author: first_user, title: 'Conquering Chili vs. Chilly: Toms Spicy Spanish Lesson', text: 'Morning from Mexico! Todays lesson: teaching kids the difference between "chili" and "chilly". Wish me warmth!')

Comment.create(post: first_post, user: second_user, text: '¡Buena suerte, Tom! Cant wait to hear all about your Mexican fiesta!' )
Like.create(post: first_post, user: second_user)
Comment.create(post: first_post, user: first_user, text: 'Thanks, Lilly! First class tomorrow, wish me luck with my Spanish!' )
Comment.create(post: first_post, user: second_user, text: 'You got this, Tom! Remember, its all about the fiesta!' )
Comment.create(post: first_post, user: first_user, text: 'Day 1: Survived! Kids are awesome, salsa is spicy, Spanish is...interesting. More adventures soon!' )
Comment.create(post: first_post, user: second_user, text: 'Haha, sounds like a typical day in Mexico! Keep rocking it, Tom! Were all cheering you on!' )