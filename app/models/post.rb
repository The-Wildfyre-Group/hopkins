class Post < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :video_attachment, ImageUploader
  mount_uploader :photo_attachment, ImageUploader
  
  friendly_id :use_for_slug, use: [:slugged, :finders]
  
  def use_for_slug
    existing_post = Post.where('LOWER(title) = ?', self.title)
    "#{title} #{existing_post.count if existing_post.present?}"
  end
  
  
  def next
    approved_posts = self.class.where(approved: true)
    if approved_posts.where("id > ?", id).present?
      approved_posts.where("id > ?", id).first
    else
      approved_posts.first
    end
  end
  
end
