class SurveysController < ApplicationController
layout "survey"
  
  def index
    @services = HTTParty.get('https://api.typeform.com/v0/form/F2ptjY?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
    render layout: "application"
  end
  
  def status;end
  
  def services;end
  
  def behavior;end
  
  def phych;end
  
  def closing;end
  
  
end
