class CatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token ,:only=>["create"]
  
  respond_to :html, :json

    #http://localhost:3000/catches?user_id=1&account_id=1&catch_type=DEPOSIT&amount=200&status=PENDING
  #http://localhost:3000/catches?user_id=1&account_id=1&catch_type=BUYTOKEN&amount=300&status=PENDING&ref_num=KDB4HFPKPW
  def create
    response = "catch not saved"
    status = 401

  	fisherman = User.find(params["user_id"])

    @catch = fisherman.catches.new
    if @catch.save
      	cprofile = CatchProfile.new
  		cprofile.catch_id = @catch.id
  		cprofile.species = params['species']
  		cprofile.quantity = params['quantity']
        response = "catch saved"
        status = 200
    end
    render :status=>status,:json=>{:message=>response}
  end

  private
	def safe_params
   		permit_params(:user_id, catch_profiles_attributes: [:id, :species, :quantity])
    end  
end
