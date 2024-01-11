class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create_commit :update_comments_counter


  private

  def update_comments_counter
    post.update(comments_count: post.comments.count)
  end
end
