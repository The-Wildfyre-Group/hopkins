class MainController < ApplicationController
  layout 'main'

  def index
  end

  def about
  end

  def stories
  end

  def partners
  end

  def contact
  end

  def share_your_story
  end

  def bio_laveist
  end

  def bio_thorpe
  end

  def bio_mouton
  end

  def bio_neighbors
  end

  def bio_howard
  end

  def bio_gaskin
  end

  def bio_bruce
  end

  def bio_griffith
  end

  def test
    @data = HTTParty.get('https://api.typeform.com/v0/form/T6ExzV?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
    @services = HTTParty.get('https://api.typeform.com/v0/form/F2ptjY?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
  end
end
