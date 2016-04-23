class BidsController < ApplicationController
#  before_filter :authenticate_user!
  respond_to :html, :json

  def index
	@services = Service.all
	respond_with(@services)
  end

  def show
  	@service = Service.find(params[:id])
	respond_with(@service)
  end

end