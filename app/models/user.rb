class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def update_posts_counter
    postsCounter
    save
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
