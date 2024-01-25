require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
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
  context 'User index page' do
    it 'should have 2 users' do
      visit '/users'
      expect(page.all('#user_photo').count).to eq(2)
    end

    it "shows the user's username" do
      visit '/users'
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end

    it "shows the user's username" do
      visit '/users'
      expect(page).to have_content('Tom')
    end

    it 'shows the number of posts the user has written' do
      visit users_path
      expect(page).to have_content('Number of posts: 4')
    end
  end
  context 'navigation' do
    it 'shows the profile picture for each user' do
      visit users_path
      expect(page).to have_css("img[src='#{@first_user.photo}']")
      expect(page).to have_css("img[src='#{@second_user.photo}']")
    end

    it 'when clicking on a user, it should take you to their show page' do
      visit users_path
      click_link('Tom')
      expect(page).to have_current_path("/users/#{@first_user.id}")
    end
  end
end
