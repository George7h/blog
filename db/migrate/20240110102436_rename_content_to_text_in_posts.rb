class RenameContentToTextInPosts < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :content, :text
  end
end
