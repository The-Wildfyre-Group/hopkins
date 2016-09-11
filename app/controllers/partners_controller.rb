class PartnersController < ApplicationController
  def index
    @partners = Partner.all
  end

  def create
    @partner = Partner.create(partner_params)
  end

  private

  def partner_params
    params.require(:partner).permit!
  end
end