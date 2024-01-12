require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { FactoryBot.create(:user) }

  context 'Post attributes to be present' do
    it 'should not be valid without a text' do
      post = FactoryBot.build(:post, title: nil, author: user)
      expect(post).to_not be_valid
    end

    it 'title should not be too long' do
      post = FactoryBot.build(:post, title: 'a' * 251, author: user)
      expect(post).to_not be_valid
    end
  end

  context 'comments_counter should only be numerical, greater_than or equal 0' do
    it 'should only take integer values' do
      post = FactoryBot.build(:post, comments_count: 'a', author: user)
      expect(post).to_not be_valid
    end

    it 'should not be valid with a negative comments_count' do
      post = FactoryBot.build(:post, comments_count: -1, author: user)
      expect(post).to_not be_valid
    end

    it 'should be valid with non-negative comments_count value' do
      post = FactoryBot.build(:post, comments_count: 1, author: user)
      expect(post).to be_valid
    end
  end

  describe '#recent_comments' do
    it 'it returns five most recent comments' do
      post = FactoryBot.create(:post, author: user)
      FactoryBot.create_list(:comment, 3, post: post, created_at: 4.days.ago)
      recent_comments = FactoryBot.create_list(:comment, 5, post: post)

      expect(post.recent_comments).to eq(recent_comments.reverse)
    end
  end

  describe '#update_posts_counter' do
    it "updates author's posts_counter after commit" do
      expect(user.postsCounter).to eq(0)

      FactoryBot.create(:post, author: user)
      user.reload

      expect(user.postsCounter).to eq(1)
    end
  end
end
