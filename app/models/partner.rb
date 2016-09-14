class Partner < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
  has_and_belongs_to_many :users
  
  def user_count
    users.count
  end
  
  def self.ordered_by_participants
    all.sort_by { |partner| partner.user_count }
  end
  
  
end