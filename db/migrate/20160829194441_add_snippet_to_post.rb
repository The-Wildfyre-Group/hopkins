class AddSnippetToPost < ActiveRecord::Migration
  def change
    add_column :posts, :name, :string
    add_column :posts, :email, :string
    add_column :posts, :snippet, :text
    add_column :posts, :keyword, :string
  end
end
