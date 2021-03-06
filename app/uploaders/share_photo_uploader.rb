# encoding: utf-8

class SharePhotoUploader < BaseUploader

  # process resize_to_fit: [600, 500]
  process resize_to_fit: [487, 255]
  process :store_dimensions
  process :add_text

  def add_text
    second_image = MiniMagick::Image.open(Rails.root.join('app','assets','images','rise-layout.png'))
    manipulate! do |image|

      # second_image.combine_options do |c|
      #   c.gravity 'Center'
      #   c.pointsize '120'
      #   c.draw "text 0,115 '#{model.message.upcase.split(' ')[0]}'"
      #   c.pointsize '165'
      #   c.weight '700'
      #   c.draw "text 0,265 '#{model.message.upcase.split(' ')[1]}'"
      #   c.fill 'white'
      # end

      second_image.combine_options do |c|
        c.gravity 'Center'
        if model.message.split(' ').size <= 3
          c.pointsize '120'
          c.draw "text 0,115 '#{model.message.upcase.split(' ')[0]}'"
          c.pointsize '165'
          c.weight '700'
          c.draw "text 0,265 '#{model.message.upcase.split(' ')[1]} #{model.message.upcase.split(' ')[2]}'"
        else
          c.pointsize '120'
          c.draw "text 0,115 '#{model.message.upcase.split(' ')[0]} #{model.message.upcase.split(' ')[1]}'"
          c.pointsize '165'
          c.weight '700'
          c.draw "text 0,265 '#{model.message.upcase.split(' ')[2]} #{model.message.upcase.split(' ')[3]} #{model.message.upcase.split(' ')[4]}'"
        end
        c.fill 'white'
      end

      # width:487px;height:255px;

      # second_image.resize("600x500")
      second_image.resize("487x255")

      result = image.composite(second_image) do |c|
        c.compose "Over"
        c.gravity "Center"
      end

      result
    end
  end

  private

  def store_dimensions
    if file && model
      model.width, model.height = ::MiniMagick::Image.open(file.file)[:dimensions]
    end
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :resize_to_fit => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_white_list
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
