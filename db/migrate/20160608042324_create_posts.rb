class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :video_attachment
      t.string :video_link
      t.string :photo_attachment
      t.string :photo_link
      t.text :description
      t.string :slug

      t.timestamps
    end
  end
end
