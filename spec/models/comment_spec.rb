require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'update_comment_count' do
    it 'update post comment_count after save' do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, author: user)

      expect(post.comments_count).to eq(0)

      FactoryBot.create(:comment, user:, post:)
      post.reload

      expect(post.comments_count).to eq(1)
    end
  end
end
