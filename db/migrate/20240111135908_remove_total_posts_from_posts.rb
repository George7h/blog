class RemoveTotalPostsFromPosts < ActiveRecord::Migration[7.1]
  def change
    remove_column :posts, :total_posts, :integer
  end
end
