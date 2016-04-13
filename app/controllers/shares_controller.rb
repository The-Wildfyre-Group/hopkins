class SharesController < ApplicationController
  def create
    @share = Share.create(share_params)
  end

  def show
    @share = Share.find(params[:id])
    render layout: 'share'
  end

  private

  def share_params
    params.require(:share).permit(:i_am, :and)
  end
end