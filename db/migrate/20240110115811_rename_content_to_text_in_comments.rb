class RenameContentToTextInComments < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :content, :text
  end
end
