class RenameCommentContentColumnToComments < ActiveRecord::Migration[6.0]
  def change
    rename_column :comments, :comment_content, :content
  end
end
