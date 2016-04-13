class Share < ActiveRecord::Base
  attr_accessor :i_am, :and

  after_create :setup_photo

  mount_uploader :photo, SharePhotoUploader

  def i_am=(val)
    self.message = "I am #{val}"
  end

  def and=(val)
    self.message << " and #{val}"
  end

  def setup_photo
    File.open(Rails.root.join('app','assets','images','share_base.jpg')) do |f|
      self.photo = f
    end
    save!
  end
end