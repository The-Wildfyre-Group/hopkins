class Partner < ActiveRecord::Base
  mount_uploader :logo, ImageUploader
end