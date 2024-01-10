class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.references :author, foreign_key: { to_table: :users }
      t.integer :comments_count, default: 0
      t.integer :likes_count, default: 0
      t.integer :total_posts, default: 0

      t.timestamps
    end
  end
end
