class Post < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :video_attachment, ImageUploader
  mount_uploader :photo_attachment, ImageUploader
  
  friendly_id :use_for_slug, use: [:slugged, :finders]
  
  def use_for_slug
    existing_post = Post.where('LOWER(title) = ?', self.title)
    "#{title} #{existing_post.count if existing_post.present?}"
  end
  
  
end
