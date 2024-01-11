class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit :update_likes_counter

  private

  def update_likes_counter
    post.update(likes_count: post.likes.count)
  end
end
