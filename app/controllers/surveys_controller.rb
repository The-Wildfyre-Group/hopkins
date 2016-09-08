class SurveysController < ApplicationController
  before_action :authenticate_user!
  before_action :completed_all_surveys?
  layout "survey"

  def index
    @services = HTTParty.get('https://api.typeform.com/v0/form/F2ptjY?key=893f6cea38785bbc15d71f06bcd07bf5e15653dd')
    render layout: "application"
  end

  def status;end

  def services;end

  def behavior;end

  def psychosocial;end

  def closing;end
end
