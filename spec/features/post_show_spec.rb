require 'rails_helper'
RSpec.feature 'post show page', type: :feature do
  before :all do
    Like.delete_all
    Comment.delete_all
    Post.delete_all
    User.delete_all
    @first_user = User.create(name: 'Tom',
                              photo: 'https://images.pexels.com/photos/1792596/pexels-photo-1792596.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', bio: 'Teacher from Mexico.')
    @second_user = User.create(name: 'Lilly',
                               photo: 'https://images.pexels.com/photos/6635006/pexels-photo-6635006.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', bio: 'Teacher from Poland.')
    @first_post = Post.create(author: @first_user, title: 'Traveling is life',
                              text: 'Hola mis amigos! Ready to spice up my life with tacos and teaching!')
    @second_post = Post.create(author: @first_user, title: 'Elote Epiphany: Toms Tastebuds Do the Macarena',
                               text: 'Sweet corn on the cob? More like an edible fiesta!')
    @third_post = Post.create(author: @first_user, title: 'Pyramids & Puns: Toms Teotihuacan Adventure',
                              text: 'Pyramids, ancient vibes, and enough cactus jokes to fill a sombrero.')
    @fourth_post = Post.create(author: @first_user, title: 'Conquering Chili vs. Chilly: Toms Spicy Spanish Lesson',
                               text: 'Morning from Mexico! Todays lesson: teaching kids')
    Comment.create(post: @first_post, user: @second_user,
                   text: '¡Buena suerte, Tom! Cant wait to hear all about your Mexican fiesta!')
    Like.create(post: @first_post, user: @second_user)
    Comment.create(post: @first_post, user: @first_user,
                   text: 'Thanks, Lilly! First class tomorrow, wish me luck with my Spanish!')
    Comment.create(post: @first_post, user: @second_user,
                   text: 'You got this, Tom! Remember, its all about the fiesta!')
    Comment.create(post: @first_post, user: @first_user,
                   text: 'Day 1: Survived! Kids are awesome. More adventures soon!')
    Comment.create(post: @first_post, user: @second_user,
                   text: 'Haha, sounds like a typical day in Mexico! Keep rocking it, Tom! Were all cheering you on!')
  end
  it 'I can see a posts title' do
    visit "/users/#{@first_user.id}/posts?page=2"
    expect(page).to have_content(@first_post.title)
  end
  it 'I can see who wrote the post' do
    visit "/users/#{@first_user.id}/posts?page=2"
    click_link('Traveling is life')
    expect(page).to have_content('Written by Tom')
  end
  it 'I can see the number of comments a post has' do
    visit "/users/#{@first_user.id}/posts?page=2"
    click_link('Traveling is life')
    expect(page).to have_content('Comments: 5')
  end
  it 'I can see the number of likes a post has' do
    visit "/users/#{@first_user.id}/posts?page=2"
    click_link('Traveling is life')
    expect(page).to have_content('Likes: 1')
  end
  it 'I can see the posts body' do
    visit "/users/#{@first_user.id}/posts?page=2"
    click_link('Traveling is life')
    expect(page).to have_content('Hola mis amigos! Ready to spice up my life with tacos and teaching!')
  end
  it 'I can see the username of each commentor' do
    visit "/users/#{@first_user.id}/posts?page=2"
    click_link('Traveling is life')
    expect(page).to have_content('Lilly')
  end
  it 'I can see the body of each comment' do
    visit "/users/#{@first_user.id}/posts?page=2"
    click_link('Traveling is life')
    expect(page).to have_content('Lilly: ¡Buena suerte, Tom! Cant wait to hear all about your Mexican fiesta!')
  end
end
