class RenameCommentsToArticleComments < ActiveRecord::Migration[5.1]
  def change
    rename :comments, :article_comments
  end
end
