class Admin::PartnersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin!
  expose :partners, ->{ Partner.all }
  expose :partner

  def index
    @partners = Partner.all
  end

  def create
    if partner.save
      redirect_to admin_partners_path
    else
      render :new
    end
  end

  def update
    if partner.update(partner_params )
      redirect_to admin_partners_path
    else
      render :edit
    end
  end

  def destroy
    partner.destroy
    redirect_to admin_partners_path
  end

  private

    def partner_params
      params.require(:partner).permit!
    end
end