class MainController < ApplicationController
  def index
    
  end
  
  def test
    @data = HTTParty.get('https://api.typeform.com/v0/form/T6ExzV?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
    @services = HTTParty.get('https://api.typeform.com/v0/form/F2ptjY?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
    
  end
end
