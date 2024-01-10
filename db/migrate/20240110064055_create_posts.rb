class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :author_id
      t.integer :comments_count
      t.integer :likes_count
      t.integer :total_posts

      t.timestamps
    end
  end
end
