class Share < ActiveRecord::Base
  mount_uploader :photo, SharePhotoUploader

  def full_message
    "I RISE FOR #{message}"
  end
end