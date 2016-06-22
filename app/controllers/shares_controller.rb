class SharesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @share = Share.create(share_params)
  end

  def show
    @share = Share.find(params[:id])
    render layout: 'share'
  end

  private

  def share_params
    params.require(:share).permit(:message, :photo)
  end
end