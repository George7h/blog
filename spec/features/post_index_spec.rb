require 'rails_helper'
RSpec.feature 'post index page', type: :feature do
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
  it 'i can see the user profile picture' do
    visit "/users/#{@first_user.id}/posts"
    sleep(1)
    expect(page).to have_css('img#user_photo')
  end
  it 'i can see the user name' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Tom')
  end
  it 'i can see the number of posts the user has written' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Number of posts: 4')
  end
  it 'I can see a posts title' do
    visit "/users/#{@first_user.id}/posts?page=2"
    expect(page).to have_content('Traveling is life')
  end
  it 'I can see some of the posts body' do
    visit "/users/#{@first_user.id}/posts?page=2"
    expect(page).to have_content('Traveling is life')
  end
  it 'I can see the first comments on a post' do
    visit "/users/#{@first_user.id}/posts?page=2"
    expect(page).to have_content('Lilly: ¡Buena suerte, Tom! Cant wait to hear all about your Mexican fiesta!')
  end
  it 'I can see how many comments a post has' do
    visit "/users/#{@first_user.id}/posts?page=2"
    expect(page).to have_content('Comments: 5')
  end
  it 'I can see how many likes a post has' do
    visit "/users/#{@first_user.id}/posts?page=2"
    expect(page).to have_content('Likes: 1')
  end
  it 'I can see a section for pagination if there are more posts than fit on the view' do
    visit "/users/#{@first_user.id}/posts"
    expect(page).to have_content('Previous 1 2 Next')
  end
  it 'When I click on a post, it redirects me to the post show page' do
    visit "/users/#{@first_user.id}/posts?page=2"
    click_link('Traveling is life')
    expect(page).to have_current_path("/users/#{@first_user.id}/posts/#{@first_post.id}")
  end
end
